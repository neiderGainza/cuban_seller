import 'package:bloc/bloc.dart';
import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/account_repository.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/coin_repository.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_account_usecases.dart';
import 'package:cuban_seller/features/account_form/view_model/account_form_state.dart';
import 'package:cuban_seller/features/form_fields/balance.dart';
import 'package:cuban_seller/features/form_fields/coin.dart';
import 'package:cuban_seller/features/form_fields/name.dart';
import 'package:formz/formz.dart';


class AccountFormCubit extends Cubit<AccountFormState>{
  final AccountRepository _accountRepository;
  final CoinRepository _coinRepository;
  final _account;

  AccountFormCubit({
    required AccountRepository accountRepository,
    required CoinRepository coinRepository,

    account
  }): _accountRepository = accountRepository, _coinRepository = coinRepository, _account = account,
  super( 
    const AccountFormState(
      name:     NameFormField.unvalidated(), 
      balance:  BalanceFormField.unvalidated(), 
      coin:     CoinFormField.unvalidated(), 
      submitionStatus: SubmitionStatus.loading
    )
  ){
    getCoins();

    if(_account != null){
      // obtener coin from _account
      emit(
        state.copyWith(
          name    : NameFormField.unvalidated(_account.name),
          coin    : CoinFormField.unvalidated(), // falta agregarle la moneda inicial,
          balance : BalanceFormField.unvalidated(_account.balance) 
        )
      );
    } 
  }

  // leer de manera asincrona las coins
  void getCoins() async {
    final coins = await _coinRepository.getAllCoins();
    emit(
      state.copyWith(
        coins: coins,
        submitionStatus: SubmitionStatus.loaded
      )
    );
  }

  // Special Validators
  NameFormField _validateNameIfNecesary(String newValue, [bool forceValidation = false]){
    // aqui validaciones con el backend
    // if (_accountRepository.containsName(NewValue)) newName = Name.alreadyInUse(newValue);

    return (state.name.displayError != null || forceValidation)
      ? NameFormField.validated(newValue)
      : NameFormField.unvalidated(newValue);
  }

  CoinFormField _validateCoinIfNecesary(String ? newValue, [bool forceValidation = false]){
    newValue = newValue??'';
    return (state.coin.displayError != null || forceValidation)
      ? CoinFormField.validated(newValue)
      : CoinFormField.unvalidated(newValue);
  }


  /// UI
  void onNameChanged(String newValue){
    emit( state.copyWith(name: _validateNameIfNecesary(newValue)) );
  }

  void onBalanceChanged(String newValue){
    emit( state.copyWith(balance: BalanceFormField.validated(newValue)) );
  }

  void onCoinChanged(String ? newValue){
    emit( state.copyWith(coin: _validateCoinIfNecesary(newValue)) );
  }


  void onCoinAdded(String value){
    emit(
      state.copyWith(
        coin: _validateCoinIfNecesary(value),
        coins: [...state.coins, Coin(value: value)]
      )
    );
  }


  // general validation
  void onValidate(){
    final balance = BalanceFormField.validated(state.balance.value);
    final name    = _validateNameIfNecesary(state.name.value,true);
    final coin    = _validateCoinIfNecesary(state.coin.value,true);
    

    final isFormValid = Formz.validate([
      balance,
      name,
      coin
    ]);    

    if (isFormValid){
      _accountRepository.insertAccount(
        // should i put a try
        InsertAccountParam(
          name: name.value,
          amount: double.parse( balance.value ), 
          coin: Coin(value: coin.value)
        )
      );
      // si _account != null update on account_id
    }

    emit(
      state.copyWith(
        balance : balance,
        name    : name,
        coin    : coin,
        submitionStatus: isFormValid ? SubmitionStatus.success : SubmitionStatus.rejected 
      )
    );

  } 


}