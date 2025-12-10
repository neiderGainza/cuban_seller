import 'package:cuban_seller/futures/account_form/view/account_form_view.dart';
import 'package:cuban_seller/futures/account_list/view/account_list_view.dart';
import 'package:cuban_seller/futures/coin_form/view/coin_form_view.dart';
import 'package:cuban_seller/futures/component_library/navigation/navigation_frame.dart';
import 'package:cuban_seller/futures/product_list/view/product_list_view.dart';
import 'package:cuban_seller/futures/sell_list/view/sell_list_view.dart';
import 'package:cuban_seller/futures/shop_list/view/shop_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


void main() async {
  runApp(const CubanSeller());
}

final navigationFrame = NavigationFrame(
  navigationFunction: (int actualPage, int futurePage, BuildContext context){
    switch (futurePage){
      case 0:
        context.go('/');
      case 1:
        context.go('/products');
      case 2:
        context.go('/shop');
      case 3:
        context.go('/sell');
    }
  },
);


final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child){
        return navigationFrame.copyWith(
          body: child
        );
      },
      routes: [
        // cuentas
        GoRoute(
          path: '/',
          builder: (context, state) => AccountListView(
            onAddNewAccount: 
            () => showDialog(
                context: context, 
                builder: (context) => AccountFormView(
                  onAddNewCoin: 
                  () => showDialog<String>(
                    context: context, 
                    builder: (context) => CoinFormView()
                  ),
                )
              ),
          ),
        ),
        
        // productos
        GoRoute(
          path: '/products',
          builder: (context,state) => ProductListView()
        ),
        
        // shoping
        GoRoute(
          path: '/shop',
          builder: (context,state) => ShopListView()
        ),

        // selling
        GoRoute(
          path: '/sell',
          builder: (context,state) => SellListView()
        ),
      ]
    )
    
  ]
);






class CubanSeller extends StatelessWidget {
  const CubanSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      
      routerConfig: router,
    );
  }
}





