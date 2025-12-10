import 'package:cuban_seller/features/account_form/view_model/account_form_cubit.dart';
import 'package:cuban_seller/features/account_form/view_model/account_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceFormField extends StatelessWidget {
  const BalanceFormField({
    super.key,
    required TextEditingController balanceController,
  }) : _balanceController = balanceController;

  final TextEditingController _balanceController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountFormCubit, AccountFormState>(
      builder: (context, state) {
        return TextFormField( 
          controller: _balanceController,
          onChanged: context.watch<AccountFormCubit>().onBalanceChanged,

          decoration: InputDecoration(
            // labelText: "Saldo"
            errorText: state.balance.displayError?.errorMessage
          ),
        );
      }
    );
  }
}
