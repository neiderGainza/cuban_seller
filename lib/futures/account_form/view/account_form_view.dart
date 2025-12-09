import 'package:cuban_seller/futures/account_form/view_model/account_form_cubit.dart';
import 'package:flutter/material.dart';


class AccountFormView extends StatefulWidget{
  const AccountFormView({
    super.key,
    accountRepository,
    coinRepository
  }): _accountRepository = accountRepository, _coinRepository = coinRepository;

  final _accountRepository;
  final _coinRepository;

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
    _balanceController.addListener(
      () => _accountFormCubit.onBalanceChanged(_balanceController.text) 
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      title: Text("Agregar nueva cuenta"),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NameFormField(nameController: _nameController),
            Row(
              children: [
                Text("Moneda: "),
                Expanded(child: CoinPicker()),
                Spacer(),
                Text("Saldo: "),
                Expanded(child: BalanceFormField(balanceController: _balanceController))
              ],
            )
          ]
        ) 
      ),
      actions: [
        TextButton(onPressed: (){ if(Navigator.canPop(context)) Navigator.pop(context);}, child: Text("Cancelar")),
        TextButton(onPressed: (){}, child: Text("Aceptar")),
      ],
    );
  }
}

class CoinPicker extends StatelessWidget {
  const CoinPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: "CUP",
      items: <DropdownMenuItem<String>>[
        DropdownMenuItem(value: "CUP" , child: Text("CUP"),),
        DropdownMenuItem(value: "USD" , child: Text("USD"),)
      
      ],
      
      onChanged: (value){}
    );
  }
}


class BalanceFormField extends StatelessWidget {
  const BalanceFormField({
    super.key,
    required TextEditingController balanceController,
  }) : _balanceController = balanceController;

  final TextEditingController _balanceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField( 
      controller: _balanceController,
      
      decoration: InputDecoration(
        // labelText: "Saldo"
      ),
    );
  }
}


class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,              
      
      decoration: InputDecoration(
        labelText: "Nombre de Cuenta",
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1)
        ),
        
      ),
    
    );
  }
}