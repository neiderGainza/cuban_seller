import 'package:cuban_seller/futures/form_fields/balance.dart';
import 'package:cuban_seller/futures/form_fields/coin.dart';
import 'package:cuban_seller/futures/form_fields/name.dart';


class AccountFormState {
  final Name name;
  final Balance balance;
  final Coin coin;
  
  final SubmitionStatus submitionStatus;
  final List<String> coins;

  const AccountFormState({
    required this.name,
    required this.balance,
    required this.coin,
    
    required this.submitionStatus,
    this.coins = const []
  });


  AccountFormState copyWith({
    Name ? name,
    Balance ? balance,
    Coin ? coin,
    SubmitionStatus ? submitionStatus,
    List<String> ? coins 
  }){
    return AccountFormState(
      name: name ?? this.name,
      balance: balance??this.balance,
      coin: coin ?? this.coin,
      submitionStatus: submitionStatus ?? this.submitionStatus,
      coins: coins ?? this.coins
    );
  }
}


enum SubmitionStatus{ 
  loading, // loading data (coins)

  loaded, // form ready to use

  rejected, // form rejected
  success;  // form accepted
}