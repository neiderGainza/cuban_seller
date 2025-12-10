import 'package:cuban_seller/data_access/account/domain/repositories/account_repository.dart';
import 'package:cuban_seller/features/account_list/view_model/account_list_bloc.dart';
import 'package:cuban_seller/features/account_list/view_model/account_list_event.dart';
import 'package:cuban_seller/features/account_list/widgets/account_grid.dart';
import 'package:cuban_seller/features/account_list/widgets/account_list.dart';
import 'package:cuban_seller/features/account_list/widgets/search_bar/cuban_seller_search_bar.dart';
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
    final accountListBloc = AccountListBloc(accountRepository: _accountRepository); 

    return BlocProvider<AccountListBloc>(
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
              onPressed: (){
                onAddNewAccount(context).then(
                  (_)=>accountListBloc.add(AccountListChanged())
                );
              },
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
        SizedBox(
          height: 56,
          child: AppBar(
            backgroundColor: colors.primary,
            title: Text("Cuentas", style: TextStyle(color: colors.onPrimary),),
          ),
        ),
        SizedBox(height:112 ,child: CubanSellerSearchBar(theme: theme,)),
        Expanded(child: AccountList())
      ],
    );

  }

  Widget desktopView(BuildContext context){
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(height: 64,child: CubanSellerSearchBar(theme: theme, mobile: false,)),
        Expanded(child: AccountGrid())
      ],
    );
  }


}