import 'package:flutter/material.dart';


class AccountList extends StatelessWidget{
  const AccountList({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        // return Text("hola");
        return AccountListItem();
      },
      itemCount: 5,
    );
  }
}


class AccountListItem extends StatelessWidget {
  const AccountListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Este es el nombre de la cuenta", maxLines: 1, overflow: TextOverflow.ellipsis,),
        subtitle: Text("coin:500")
      ),
    );
  }
}
