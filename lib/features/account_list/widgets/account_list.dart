import 'package:cuban_seller/features/account_list/view_model/account_list_bloc.dart';
import 'package:cuban_seller/features/account_list/view_model/account_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AccountList extends StatelessWidget{
  const AccountList({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountListBloc, AccountListState>(
      builder: (context, state){
        return ListView.builder(
          itemBuilder: (context, index) {
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


class AccountListItem extends StatelessWidget {
  const AccountListItem({
    super.key,

    required this.accountName,
    required this.coin,
    required this.balance
  });

  final String accountName;
  final String coin;
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(accountName, maxLines: 1, overflow: TextOverflow.ellipsis,),
        subtitle: Text("$coin: ${balance.toString()}")
      ),
    );
  }
}
