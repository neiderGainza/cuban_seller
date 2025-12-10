import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';
import 'package:cuban_seller/features/form_fields/balance.dart';
import 'package:cuban_seller/features/form_fields/coin.dart';
import 'package:cuban_seller/features/form_fields/name.dart';


class AccountFormState {
  final NameFormField name;
  final BalanceFormField balance;
  final CoinFormField coin;
  
  final SubmitionStatus submitionStatus;
  final List<Coin> coins;

  const AccountFormState({
    required this.name,
    required this.balance,
    required this.coin,
    
    required this.submitionStatus,
    this.coins = const []
  });


  AccountFormState copyWith({
    NameFormField ? name,
    BalanceFormField ? balance,
    CoinFormField ? coin,
    
    SubmitionStatus ? submitionStatus,
    List<Coin> ? coins 
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