import 'package:cuban_seller/futures/account_list/widgets/account_grid.dart';
import 'package:cuban_seller/futures/account_list/widgets/account_list.dart';
import 'package:cuban_seller/futures/component_library/navigation/cuban_seller_bottom_navigation_bar.dart';
import 'package:cuban_seller/futures/component_library/navigation/cuban_seller_top_navigation_bar.dart';
import 'package:cuban_seller/futures/account_list/widgets/search_bar/cuban_seller_search_bar.dart';
import 'package:flutter/material.dart';

class AccountListView extends StatelessWidget{
  const AccountListView({
    super.key,
    required this.onAddNewAccount
  });

  final void Function() onAddNewAccount;


  Widget mobileView(BuildContext context){
    final theme = Theme.of(context);
    final colors= theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: Text("Cuentas", style: TextStyle(color: colors.onPrimary),),
      ),
      body: Column(
        children: [
          SizedBox(height:112 ,child: CubanSellerSearchBar(theme: theme,)),
          Expanded(child: AccountList())
        ],
      ),
      bottomNavigationBar: CubanSellerBottomNavigationBar(theme: theme),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add, color: theme.colorScheme.onPrimaryContainer,),
      ),
    );
    
  }


  Widget desktopView(BuildContext context){
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: CubanSellerTopNavigationBar(theme: theme),
      ),
      body: Column(
        children: [
          SizedBox(height: 64,child: CubanSellerSearchBar(theme: theme, mobile: false,)),
          Expanded(child: AccountGrid())
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add, color: theme.colorScheme.onPrimaryContainer,),
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).size.width > 600) 
    ? desktopView(context)
    : mobileView(context);
  }
}