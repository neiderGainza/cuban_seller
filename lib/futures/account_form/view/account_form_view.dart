import 'package:cuban_seller/futures/account_form/view_model/account_form_cubit.dart';
import 'package:cuban_seller/futures/account_form/widget/balance_form_field.dart';
import 'package:cuban_seller/futures/account_form/widget/coin_picker.dart';
import 'package:cuban_seller/futures/account_form/widget/name_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AccountFormView extends StatefulWidget{
  const AccountFormView({
    super.key,
    accountRepository,
    coinRepository,

    required this.onAddNewCoin
  }): _accountRepository = accountRepository, _coinRepository = coinRepository;


  final _accountRepository;
  final _coinRepository;

  final Future<String?> Function() onAddNewCoin;



  @override
  State<AccountFormView> createState() => _AccountFormViewState();
}




class _AccountFormViewState extends State<AccountFormView> {
  final _nameController    = TextEditingController();
  final _balanceController = TextEditingController();

  late AccountFormCubit _accountFormCubit;


  @override
  void initState() {
    _accountFormCubit = AccountFormCubit(
      accountRepository: widget._accountRepository,
      coinRepository: widget._coinRepository
    );

    _balanceController.text = '0.00';
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<AccountFormCubit>(
      create: (context) => _accountFormCubit,

      child : AlertDialog(
        title: Text("Agregar nueva cuenta"),
        
        content: Form(
          
          child: Column(
            mainAxisSize: MainAxisSize.min,
            
            children: [
              // name
              NameFormField(nameController: _nameController),

              // coin
              Row(
                children: [
                  Expanded(child: Text("Moneda: ")),
                  Expanded(flex : 2 , child: CoinPicker(onAddNewCoin: widget.onAddNewCoin,)),
                ],
              ),

              //saldo
              Row(
                children: [
                  Expanded(child: Text("Saldo: ")),  
                  Expanded(flex: 2, child: BalanceFormField(balanceController: _balanceController))
                ],
              ),
            
            ]
          ) 
        ),
        
        // actions
        actions: [
          TextButton(onPressed: (){ if(Navigator.canPop(context)) Navigator.pop(context);}, child: Text("Cancelar")),
          TextButton(onPressed: (){ _accountFormCubit.onValidate(); }, child: Text("Aceptar")),
        ],
      ),
    );
  }
}
