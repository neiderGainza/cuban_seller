import 'package:cuban_seller/data_access/account/domain/entities/account.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/account_repository.dart';
import 'package:cuban_seller/features/account_list/view_model/account_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountListCubit extends Cubit<AccountListState>{
  AccountListCubit({
    required AccountRepository accountRepository
  }): _accountRepository = accountRepository, 
  super(
    AccountListState(acounts: [])
  ){
    _listenToAccountUpdates();
  }

  final AccountRepository _accountRepository;

  void updateAccountList(List<Account> accounts){
    emit(
      state.copyWith(
        acounts: accounts
      )
    );
  }

  void _listenToAccountUpdates(){
    _accountRepository.getStreamAccounts().listen(
      (accounts) => updateAccountList(accounts)
    );
  }
}