import 'package:cuban_seller/futures/form_fields/balance.dart';
import 'package:cuban_seller/futures/form_fields/name.dart';


class AccountFormState {
  final Name name;
  final Balance balance;


  const AccountFormState({
    required this.name,
    required this.balance
  });


  AccountFormState copyWith({
    Name ? name,
    Balance ? balance
  }){
    return AccountFormState(
      name: name ?? this.name,
      balance: balance??this.balance
    );
  }
}