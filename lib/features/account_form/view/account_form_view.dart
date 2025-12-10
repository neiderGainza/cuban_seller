import 'package:cuban_seller/data_access/account/domain/repositories/account_repository.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/coin_repository.dart';
import 'package:cuban_seller/features/account_form/view_model/account_form_cubit.dart';
import 'package:cuban_seller/features/account_form/view_model/account_form_state.dart';
import 'package:cuban_seller/features/account_form/widget/balance_form_field.dart';
import 'package:cuban_seller/features/account_form/widget/coin_picker.dart';
import 'package:cuban_seller/features/account_form/widget/name_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AccountFormView extends StatefulWidget{
  const AccountFormView({
    super.key,
    required AccountRepository accountRepository,
    required CoinRepository    coinRepository,

    required this.onAddNewCoin
  }): _accountRepository = accountRepository, _coinRepository = coinRepository;


  final AccountRepository _accountRepository;
  final CoinRepository _coinRepository;

  final Future<String?> Function(BuildContext context) onAddNewCoin;


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

          BlocListener<AccountFormCubit,AccountFormState>(
            listener: (context, state){
              if(state.submitionStatus == SubmitionStatus.success){
                if(Navigator.canPop(context)) Navigator.pop(context);
              }
            },
            child: SizedBox.shrink(),
          )


        ],
      ),
    );
  }
}
