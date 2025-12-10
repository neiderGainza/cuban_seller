import 'package:formz/formz.dart';

class CoinFormField extends FormzInput<String, CoinValidationError>{
  // inicializa el field sin validar
  const CoinFormField.unvalidated([String value = '']) : super.pure(value);
  
  // inicializa el field validando
  const CoinFormField.validated(  [String value = '']) : super.dirty(value);
  

  @override CoinValidationError? validator(String value) {
    return (value.trim() == '') 
          ? CoinValidationError.empty
          : (value.length != 3)
            ?CoinValidationError.invalid
            :null; 
  }
}




enum CoinValidationError{
  empty(errorMessage: "Moneda Requerida"),
  invalid(errorMessage: "Nombre incorrecto");


  final String ? errorMessage;
  const CoinValidationError({
    this.errorMessage
  });
}