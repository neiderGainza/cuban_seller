import 'package:bloc/bloc.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/coin_repository.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_coin_usecases.dart';
import 'package:cuban_seller/features/coin_form/viewmodel/coin_form_state.dart';
import 'package:cuban_seller/features/form_fields/coin.dart';


class CoinFormCubit extends Cubit<CoinFormState>{
  
  CoinFormCubit({
    required CoinRepository coinRepository
  }) : _coinRepository = coinRepository, 
  super(
    CoinFormState(
      coin: CoinFormField.unvalidated(), 
      submitionStatus: SubmitionStatus.still
    )
  );

  final CoinRepository _coinRepository;

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

  

  onValidate() async {
    final coin = _validateCoinIfNecesary(state.coin.value, true);
    
    if(coin.isValid){
      // hara falta un try??
      _coinRepository.insertCoin(
        CoinParameters(value: coin.value)
      );
    }

    emit(
      state.copyWith(
        coin: coin,
        submitionStatus: coin.isValid ? SubmitionStatus.success : SubmitionStatus.reject
      )
    );
  }
}