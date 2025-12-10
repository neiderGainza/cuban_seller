import 'package:cuban_seller/data_access/account/domain/repositories/account_repository.dart';
import 'package:cuban_seller/features/account_list/view_model/account_list_event.dart';
import 'package:cuban_seller/features/account_list/view_model/account_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountListBloc extends Bloc<AccountListEvent, AccountListState>{
  AccountListBloc({
    required AccountRepository accountRepository
  }): _accountRepository = accountRepository, 
  super(
    AccountListState(acounts: [])
  ){
    on<AccountListChanged>( onAccountListChanged );


    add(AccountListChanged());
  }

  final AccountRepository _accountRepository;


  void onAccountListChanged(AccountListChanged event, Emitter emit) async {
    emit(
      state.copyWith(
        acounts: await _accountRepository.getAccounts() 
      )
    );
  }
}