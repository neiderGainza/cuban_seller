import 'package:cuban_seller/features/account_list/view_model/account_list_bloc.dart';
import 'package:cuban_seller/features/account_list/view_model/account_list_state.dart';
import 'package:cuban_seller/features/account_list/widgets/account_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountGrid extends StatelessWidget{
  const AccountGrid({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountListBloc, AccountListState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 4
          ), 
          itemBuilder: (context, index){
            final actualAccount = state.acounts[index];

            return AccountListItem(
              accountName: actualAccount.name,
              coin: actualAccount.coin.value,
              balance: actualAccount.amount,
            );
          },
          itemCount: state.acounts.length,
        );
      },
    );
  }
}