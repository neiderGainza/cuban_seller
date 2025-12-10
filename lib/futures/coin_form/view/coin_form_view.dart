import 'package:cuban_seller/futures/coin_form/viewmodel/coin_form_cubit.dart';
import 'package:cuban_seller/futures/coin_form/viewmodel/coin_form_state.dart';
import 'package:cuban_seller/futures/form_fields/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CoinFormView extends StatefulWidget{
  const CoinFormView({
    super.key,
    coinRepository
  }): _coinRepository = coinRepository;

  final _coinRepository;

  @override
  State<CoinFormView> createState() => _CoinFormViewState();
}


class _CoinFormViewState extends State<CoinFormView> {
  final _textController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    final cubit = CoinFormCubit(widget._coinRepository);

    return BlocConsumer<CoinFormCubit, CoinFormState>(
      bloc: cubit,
      listener: (context, state) {
          if(state.submitionStatus == SubmitionStatus.success){
            Navigator.pop(context, state.coin.value);

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  SnackBar(
                    content: Text("${state.coin.value} agregado") 
                  )
              );
          } if(state.submitionStatus == SubmitionStatus.inProgress){
            // si esta carganddo no se que hacer
          }
      },

      builder: (context, state){
        
        return AlertDialog(
          title: Text("Nueva Moneda"),
          content: TextFormField(
            controller: _textController,              
      
            onChanged: cubit.onCoinChanged,
      
            decoration: InputDecoration(
              labelText: "Moneda",
              
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1)
              ),

              errorText: state.coin.displayError?.errorMessage,         
            ),
            
          ),
          actions: [
            TextButton(onPressed: (){ if(Navigator.canPop(context)) Navigator.pop(context);}, child: Text("Cancelar")),
            TextButton(onPressed: (){
              cubit.onValidate();
            }, child: Text("Aceptar")),
          ],
        ) ;
      }
    );
  }
}