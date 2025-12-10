import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';

class Account {
  final int id;
  final String name;
  final double amount;
  final Coin coin;

  Account({
    required this.id,
    required this.name,
    required this.amount,
    required this.coin,
  });
}
