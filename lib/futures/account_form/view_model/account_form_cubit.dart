import 'package:bloc/bloc.dart';
import 'package:cuban_seller/futures/account_form/view_model/account_form_state.dart';
import 'package:cuban_seller/futures/form_fields/balance.dart';
import 'package:cuban_seller/futures/form_fields/coin.dart';
import 'package:cuban_seller/futures/form_fields/name.dart';
import 'package:formz/formz.dart';


class AccountFormCubit extends Cubit<AccountFormState>{
  final _accountRepository;
  final _coinRepository;


  AccountFormCubit({
    accountRepository,
    coinRepository,

  }): _accountRepository = accountRepository, _coinRepository = coinRepository,
  super( 
    const AccountFormState(
      name:     Name.unvalidated(), 
      balance:  Balance.unvalidated(), 
      coin:     Coin.unvalidated(), 
      submitionStatus: SubmitionStatus.loading
    )
  ){
    getCoins();
  }

  // leer de manera asincrona las coins
  void getCoins() async {
    // coger las coins del repositorio
    emit(
      state.copyWith(
        submitionStatus: SubmitionStatus.loaded
      )
    );
  }

  // Special Validators
  Name _validateNameIfNecesary(String newValue, [bool forceValidation = false]){
    // aqui validaciones con el backend
    // if (_accountRepository.containsName(NewValue)) newName = Name.alreadyInUse(newValue);

    return (state.name.displayError != null || forceValidation)
      ? Name.validated(newValue)
      : Name.unvalidated(newValue);
  }

  Coin _validateCoinIfNecesary(String ? newValue, [bool forceValidation = false]){
    newValue = newValue??'';
    return (state.coin.displayError != null || forceValidation)
      ? Coin.validated(newValue)
      : Coin.unvalidated(newValue);
  }


  /// UI
  void onNameChanged(String newValue){
    emit( state.copyWith(name: _validateNameIfNecesary(newValue)) );
  }

  void onBalanceChanged(String newValue){
    emit( state.copyWith(balance: Balance.validated(newValue)) );
  }

  void onCoinChanged(String ? newValue){
    emit( state.copyWith(coin: _validateCoinIfNecesary(newValue)) );
  }


  void onCoinAdded(String value){
    emit(
      state.copyWith(
        coin: _validateCoinIfNecesary(value),
        coins: [...state.coins, value]
      )
    );
  }


  // general validation
  void onValidate(){
    final balance = Balance.validated(state.balance.value);
    final name    = _validateNameIfNecesary(state.name.value,true);
    final coin    = _validateCoinIfNecesary(state.coin.value,true);
    

    final isFormValid = Formz.validate([
      balance,
      name,
      coin
    ]);    

    if (isFormValid){
      // insertar el form
            
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