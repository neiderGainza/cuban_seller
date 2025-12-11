import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';
import 'package:cuban_seller/features/form_fields/balance.dart';
import 'package:cuban_seller/features/form_fields/coin.dart';
import 'package:cuban_seller/features/form_fields/name.dart';


class AccountFormState {
  final NameFormField name;
  final BalanceFormField balance;
  final int selectedCoin;
  
  final SubmitionStatus submitionStatus;
  final List<Coin> coins;

  const AccountFormState({
    required this.name,
    required this.balance,
    required this.selectedCoin,
    
    required this.submitionStatus,
    this.coins = const []
  });


  AccountFormState copyWith({
    NameFormField ? name,
    BalanceFormField ? balance,
    int ? selectedCoin,
    
    SubmitionStatus ? submitionStatus,
    List<Coin> ? coins 
  }){
    return AccountFormState(
      name: name ?? this.name,
      balance: balance??this.balance,
      selectedCoin: selectedCoin ?? this.selectedCoin,
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