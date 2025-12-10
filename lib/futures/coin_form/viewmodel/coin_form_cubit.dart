import 'package:bloc/bloc.dart';
import 'package:cuban_seller/futures/coin_form/viewmodel/coin_form_state.dart';
import 'package:cuban_seller/futures/form_fields/coin.dart';


class CoinFormCubit extends Cubit<CoinFormState>{
  
  CoinFormCubit(
    coinRepository
  ) : _coinRepository = coinRepository, 
  super(
    CoinFormState(
      coin: CoinFormField.unvalidated(), 
      submitionStatus: SubmitionStatus.still
    )
  );

  final _coinRepository;

  CoinFormField _validateCoinIfNecesary(String newValue, [bool forceValidation = false]){
    // aqui validaciones con el backend 
    return (state.coin.displayError != null || forceValidation)
      ? CoinFormField.validated(newValue)
      : CoinFormField.unvalidated(newValue);
  }


  void onCoinChanged(String value){
    emit(
      state.copyWith(
        coin: _validateCoinIfNecesary(value)
      )
    );
  }

  

  onValidate(){
    final coin = _validateCoinIfNecesary(state.coin.value, true);
    
    if(coin.isValid){
      // aqui se inserta 
    }

    emit(
      state.copyWith(
        coin: coin,
        submitionStatus: coin.isValid ? SubmitionStatus.success : SubmitionStatus.reject
      )
    );
  }
}