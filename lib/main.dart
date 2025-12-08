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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: Center(
        child: Text("hello"),
      ),
    );
  }
}





