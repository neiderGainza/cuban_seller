import 'package:cuban_seller/data_access/account/domain/entities/account.dart';

class AccountListState {
  final List<Account> acounts;
  
  const AccountListState({
    required this.acounts
  });


  AccountListState copyWith({
    List<Account> ? acounts
  }){
    return AccountListState(
      acounts: acounts ?? this.acounts
    );
  }  
}
