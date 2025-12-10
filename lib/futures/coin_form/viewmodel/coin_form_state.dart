import 'package:cuban_seller/futures/form_fields/coin.dart';


class CoinFormState {
  final Coin coin;
  final SubmitionStatus submitionStatus;

  const CoinFormState({
    required this.coin,
    required this.submitionStatus
  });


  CoinFormState copyWith({
    Coin ? coin,
    SubmitionStatus ? submitionStatus
  }){
    return CoinFormState(
      coin: coin ?? this.coin, 
      submitionStatus: submitionStatus ?? this.submitionStatus
    );
  }
}





enum SubmitionStatus{
  still,
  inProgress,
  reject,
  success;
}