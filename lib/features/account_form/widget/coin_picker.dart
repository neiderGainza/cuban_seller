import 'dart:ffi';

import 'package:cuban_seller/features/account_form/view_model/account_form_cubit.dart';
import 'package:cuban_seller/features/account_form/view_model/account_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CoinPicker extends StatelessWidget {
  const CoinPicker({
    super.key,
    required this.onAddNewCoin    
  });

  final Future<String?> Function(BuildContext context) onAddNewCoin;
  
  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<AccountFormCubit, AccountFormState>(
      
      builder: (context, state) {
        return DropdownButtonFormField<int>(
          dropdownColor: Theme.of(context).colorScheme.secondaryContainer,
          initialValue: 0 ,
          
          items: <DropdownMenuItem<int>>[
            for(int index = 0; index < state.coins.length; index += 1)
            DropdownMenuItem(value: index, child: Text(state.coins[index].value),),

            DropdownMenuItem(
              value: state.coins.length, 
              child: Center(
                child: FilledButton.icon(onPressed: (){
                  onAddNewCoin(context);
                }, 
                icon: Icon(Icons.add), label: Text("Nueva Moneda"),)
              )

            )
          ],
          
          onChanged: context.watch<AccountFormCubit>().onCoinChanged,
          
          decoration: InputDecoration(
            errorText: (state.submitionStatus == SubmitionStatus.loaded || state.submitionStatus == SubmitionStatus.loading)
                        ? null
                        :(state.selectedCoin != state.coins.length)?null:'Moneda Requerida',
          ),
        );  
      },
      
    );

  }
}



