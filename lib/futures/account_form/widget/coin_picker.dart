import 'package:cuban_seller/futures/account_form/view_model/account_form_cubit.dart';
import 'package:cuban_seller/futures/account_form/view_model/account_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CoinPicker extends StatelessWidget {
  const CoinPicker({
    super.key,
    required this.onAddNewCoin    
  });

  final Future<String?> Function() onAddNewCoin;

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<AccountFormCubit, AccountFormState>(
      
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          initialValue: state.coin.value,
          items: <DropdownMenuItem<String>>[
            for(final coin in state.coins)
            DropdownMenuItem(value: coin, child: Text(coin),),

            DropdownMenuItem(
              value: '' , 
              child: Center(
                child: FilledButton.icon(onPressed: (){
                  void addNewCoin(String newCoin) 
                    => context.read<AccountFormCubit>()
                        ..onCoinAdded(newCoin)
                        ..onCoinChanged(newCoin);

                  onAddNewCoin().then(
                    (newCoin){
                      if(newCoin != null){
                        addNewCoin(newCoin);

                      }
                    }
                  );
                }, 
                icon: Icon(Icons.add), label: Text("Nueva Moneda"),)
              )

            )
          ],
          
          onChanged: context.watch<AccountFormCubit>().onCoinChanged,
          
          decoration: InputDecoration(
            errorText: state.coin.displayError?.errorMessage
          ),
        );  
      },
      
    );

  }
}



