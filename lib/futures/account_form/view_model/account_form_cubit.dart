import 'package:bloc/bloc.dart';
import 'package:cuban_seller/futures/account_form/view_model/account_form_state.dart';
import 'package:cuban_seller/futures/form_fields/balance.dart';
import 'package:cuban_seller/futures/form_fields/name.dart';


class AccountFormCubit extends Cubit<AccountFormState>{
  final _accountRepository;

  AccountFormCubit({
    accountRepository,
  }): _accountRepository = accountRepository,
  super( 
    const AccountFormState(name: Name.unvalidated(), balance: Balance.unvalidated())
  );


  void onNameChanged(String newValue){
    // if (_accountRepository.containsName(NewValue)) newName = Name.alreadyInUse(newValue);
    final newName = (state.name.error == null)
    ? Name.unvalidated(newValue)
    : Name.validated(newValue);

    emit(
      state.copyWith(name: newName)
    );
  }


  void onBalanceChanged(int newValue){
    final newBalance = (state.balance.error == null)
    ? Balance.unvalidated(newValue)
    : Balance.validated(newValue);

    emit(
      state.copyWith(balance: newBalance)
    );
  }

  
}