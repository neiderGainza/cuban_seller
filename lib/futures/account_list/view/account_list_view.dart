import 'package:cuban_seller/futures/account_list/widgets/account_grid.dart';
import 'package:cuban_seller/futures/account_list/widgets/account_list.dart';
import 'package:cuban_seller/futures/account_list/widgets/search_bar/cuban_seller_search_bar.dart';
import 'package:flutter/material.dart';


class AccountListView extends StatelessWidget{
  const AccountListView({
    super.key,
    required this.onAddNewAccount,
  });

  final void Function() onAddNewAccount;


  @override
  Widget build(BuildContext context){

    return Stack(
      
      children: [
        (MediaQuery.of(context).size.width > 600) 
          ? desktopView(context) 
          : mobileView(context),
        
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
            onPressed: onAddNewAccount,
            child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimaryContainer,),
          ),
        ),
      ],

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