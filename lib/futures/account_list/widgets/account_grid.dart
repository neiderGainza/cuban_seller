import 'package:cuban_seller/futures/account_list/widgets/account_list.dart';
import 'package:flutter/material.dart';

class AccountGrid extends StatelessWidget{
  const AccountGrid({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 4
      ), 
      itemBuilder: (context, index){
        return AccountListItem();
      },
      itemCount: 5,
    );
  }
}