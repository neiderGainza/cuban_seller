import 'package:cuban_seller/features/form_fields/coin.dart';


class CoinFormState {
  final CoinFormField coin;
  final SubmitionStatus submitionStatus;

  const CoinFormState({
    required this.coin,
    required this.submitionStatus
  });


  CoinFormState copyWith({
    CoinFormField ? coin,
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