import 'package:formz/formz.dart';

class Balance extends FormzInput<String, BalanceValidationError>{
  const Balance.validated(  [String value = '0.00']):super.pure(value);
  const Balance.unvalidated([String value = '0.00']):super.dirty(value); 


  @override
  BalanceValidationError? validator(String value) {
    final _value = double.tryParse(value);
    
    return (_value == null)
    ? BalanceValidationError.mostBeNumber
    : (_value < 0)
        ?BalanceValidationError.negativeAmount
        :null; 
  }
}




enum BalanceValidationError{
  negativeAmount(errorMessage: "No puedes crear una cuenta en negativos"),
  empty(errorMessage: "Debes especificar un valor"),
  mostBeNumber(errorMessage: "The amount must be a number")
  ;

  final String ? errorMessage;
  const BalanceValidationError({
    this.errorMessage
  });
}