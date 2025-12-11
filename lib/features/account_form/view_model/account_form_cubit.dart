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
      name           : NameFormField.unvalidated(), 
      balance        : BalanceFormField.unvalidated(), 
      selectedCoin   : 0, 
      submitionStatus: SubmitionStatus.loading
    )
  ){
    _subscribeToCoinsChenge();
  }

  void _subscribeToCoinsChenge() async {
    await for (final coins in _coinRepository.getStreamAllCoins()){
      emit(
        state.copyWith(
          coins: coins,
          submitionStatus: SubmitionStatus.loaded
        )
      );
    }
  }

  // Special Validators
  NameFormField _validateNameIfNecesary(String newValue, [bool forceValidation = false]){
    // aqui validaciones con el backend
    // if (_accountRepository.containsName(NewValue)) newName = Name.alreadyInUse(newValue);

    return (state.name.displayError != null || forceValidation)
      ? NameFormField.validated(newValue)
      : NameFormField.unvalidated(newValue);
  }

  /// UI
  void onNameChanged(String newValue){
    emit( state.copyWith(name: _validateNameIfNecesary(newValue)) );
  }

  void onBalanceChanged(String newValue){
    emit( state.copyWith(balance: BalanceFormField.validated(newValue)) );
  }

  void onCoinChanged(int ? newValue){
    emit( state.copyWith(selectedCoin: newValue) );
  }

  
  // general validation
  void onValidate(){
    final balance = BalanceFormField.validated(state.balance.value);
    final name    = _validateNameIfNecesary(state.name.value,true);

    final isThereCoinSelected = state.selectedCoin != state.coins.length;
    
    final isFormValid = Formz.validate([
      balance,
      name,
    ]);    


    if (isFormValid && isThereCoinSelected){
      _accountRepository.insertAccount(
        // should i put a try
        InsertAccountParam(
          name:   name.value,
          amount: double.parse( balance.value ), 
          coin:   state.coins[state.selectedCoin]
        )
      );
    
    }
    
    emit(
      state.copyWith(
        balance : balance,
        name    : name,
        submitionStatus: isFormValid ? SubmitionStatus.success : SubmitionStatus.rejected 
      )
    );

  } 


}