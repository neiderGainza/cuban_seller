import 'package:cuban_seller/data_access/account/domain/repositories/account_repository.dart';
import 'package:cuban_seller/features/account_list/view_model/account_list_cubit.dart';
import 'package:cuban_seller/features/account_list/widgets/account_grid.dart';
import 'package:cuban_seller/features/account_list/widgets/account_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AccountListView extends StatelessWidget{
  const AccountListView({
    super.key,
    required this.onAddNewAccount,
    required AccountRepository accountRepository
  }): _accountRepository = accountRepository;

  final Future<void> Function(BuildContext context) onAddNewAccount;
  final AccountRepository _accountRepository;

  @override
  Widget build(BuildContext context){
    final accountListBloc = AccountListCubit(accountRepository: _accountRepository); 

    return BlocProvider<AccountListCubit>(
      create: (context) => accountListBloc,
      child: Stack(
        
        children: [
          (MediaQuery.of(context).size.width > 600) 
            ? desktopView(context) 
            : mobileView(context),
          
          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton(
              onPressed: (){ onAddNewAccount(context); },
              child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimaryContainer,),
            ),
          ),
        ],
      
      ),
    );
    
  }


  Widget mobileView(BuildContext context){
    final theme  = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      children: [
        SafeArea(
          child: SizedBox(
            height: 56,
            child: AppBar(
              backgroundColor: colors.primary,
              title: Text("Cuentas", style: TextStyle(color: colors.onPrimary),),
            ),
          ),
        ),
        Expanded(child: AccountList())
      ],
    );

  }

  Widget desktopView(BuildContext context){
    return AccountGrid();
  }


}