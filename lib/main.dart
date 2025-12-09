import 'package:cuban_seller/futures/account_form/view/account_form_view.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const CubanSeller());
}


class CubanSeller extends StatelessWidget {
  const CubanSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),

      home: AccountFormView(),
    );
  }
}





