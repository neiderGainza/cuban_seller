import 'package:formz/formz.dart';

class Balance extends FormzInput<int, BalanceValidationError>{
  const Balance.validated(  [int value = 0]):super.pure(value);
  const Balance.unvalidated([int value = 0]):super.dirty(value); 


  @override
  BalanceValidationError? validator(int value) {
    throw UnimplementedError();
  }
}




enum BalanceValidationError{
  negativeAmount(errorMessage: "No puedes crear una cuenta en negativos"),
  empty(errorMessage: "Debes especificar un valor")
  ;

  final String ? errorMessage;
  const BalanceValidationError({
    this.errorMessage
  });
}