import 'package:cuban_seller/features/account_form/view_model/account_form_cubit.dart';
import 'package:cuban_seller/features/account_form/view_model/account_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<AccountFormCubit, AccountFormState>(
      builder: (context, state) {
    
        return TextFormField(
          controller: _nameController,              
    
          onChanged: context.watch<AccountFormCubit>().onNameChanged,
    
          decoration: InputDecoration(
            labelText: "Nombre de Cuenta",
            
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1)
            ),

            errorText: state.name.displayError?.errorMessage,         
          ),
          
        );
      },
    );
  }
}