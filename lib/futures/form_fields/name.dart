import 'package:formz/formz.dart';


class Name extends FormzInput<String, NameValidationError>{
  final bool nameAlreadyInUse;
  
  // inicializa el field sin validar
  const Name.unvalidated([String value = ''])
    : nameAlreadyInUse = false, super.pure(value);
  
  // inicializa el field validando
  const Name.validated(  [String value = ''])
    : nameAlreadyInUse = false, super.dirty(value);
  
  // inicializa el field con nameAlreadyinUse
  const Name.alreadyInUse([String value =''])
    : nameAlreadyInUse = true,  super.dirty(value);


  @override
  NameValidationError ? validator(String value){
    return (value.trim() == '')
          ? NameValidationError.empty
          : (value.length < 3)
            ? NameValidationError.tooShort
            :null;
  }

}




enum NameValidationError{
  empty(errorMessage:"Un nombre es requerido"),
  alreadyInUse(errorMessage: "Nombre en uso"),
  tooShort(errorMessage: "El nombre debe tener más de 3 caracteres");


  final String ? errorMessage;
  const NameValidationError({
    this.errorMessage
  });
}



