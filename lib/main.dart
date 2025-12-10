import 'package:cuban_seller/data_access/account/data/datasources/local/app_database.dart';
import 'package:cuban_seller/data_access/account/data/repositories/account_repository_implement.dart';
import 'package:cuban_seller/data_access/account/data/repositories/coin_repository_implement.dart';
import 'package:cuban_seller/features/account_form/view/account_form_view.dart';
import 'package:cuban_seller/features/account_list/view/account_list_view.dart';
import 'package:cuban_seller/features/coin_form/view/coin_form_view.dart';
import 'package:cuban_seller/features/component_library/navigation/navigation_frame.dart';
import 'package:cuban_seller/features/product_list/view/product_list_view.dart';
import 'package:cuban_seller/features/sell_list/view/sell_list_view.dart';
import 'package:cuban_seller/features/shop_list/view/shop_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


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


void main() async {
  // Inicializando services
  final _dataBase = AppDatabase();
  
  // Inicializando repositories
  final accountRepository = AccountRepositoryImplement(_dataBase);
  final coinRepository    = CoinRepositoryImplement(_dataBase);

  // Inicializando vistas
  final coinFormView    = CoinFormView(coinRepository: coinRepository);
  
  final accountFormView = AccountFormView(
    accountRepository: accountRepository, 
    coinRepository: coinRepository, 
    onAddNewCoin:
    (context) => showDialog<String>(
      context: context, 
      builder: (context) => coinFormView
    )
  ); 

  final accountListView = AccountListView(
    accountRepository: accountRepository,
    onAddNewAccount: (context) => showDialog(
      context: context, 
      builder: (context) => accountFormView
    ), 
  );


  // estableciendo navegacion
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
            builder: (context, state) => accountListView
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


  runApp(CubanSeller(
    router: router,
  ));
}



class CubanSeller extends StatelessWidget {
  const CubanSeller({
    super.key,
    required this.router
  });

  final GoRouter router;

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





