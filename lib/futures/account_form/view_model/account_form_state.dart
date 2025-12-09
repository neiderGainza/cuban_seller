import 'package:cuban_seller/futures/form_fields/balance.dart';
import 'package:cuban_seller/futures/form_fields/name.dart';



class AccountFormState {
  final Name name;
  final Balance balance;
  final String coin;

  const AccountFormState({
    required this.name,
    required this.balance,
    required this.coin
  });


  AccountFormState copyWith({
    Name ? name,
    Balance ? balance,
    String ? coin
  }){
    return AccountFormState(
      name: name ?? this.name,
      balance: balance??this.balance,
      coin: coin ?? this.coin
    );
  }
}