import 'package:cuban_seller/futures/component_library/navigation/cuban_seller_bottom_navigation_bar.dart';
import 'package:cuban_seller/futures/component_library/navigation/cuban_seller_top_navigation_bar.dart';
import 'package:flutter/material.dart';



class NavigationFrame extends StatelessWidget{
  const NavigationFrame({
    super.key,
    this.appBar,
    this.floatingActionButton,
    this.body,
    
    required this.navigationFunction,
  });


  final PreferredSizeWidget ? appBar;
  final FloatingActionButton ? floatingActionButton;
  final Widget ? body;
  final void Function(int actualPage, int futurePage, BuildContext context) navigationFunction;
  
  Widget desktopView(BuildContext context){
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        
        flexibleSpace: CubanSellerTopNavigationBar(
          theme: theme,
          navigationFunction: navigationFunction,
        ),

      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }


  Widget mobileView(BuildContext context){
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: CubanSellerBottomNavigationBar(
        theme: theme,
        navigationFunction: navigationFunction,
      ),
      
      appBar: appBar,
      body  : body,
      floatingActionButton: floatingActionButton,
    );
  }
  
  
  @override 
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).size.width > 600) 
    ? desktopView(context)
    : mobileView(context);
  }



  NavigationFrame copyWith({
    PreferredSizeWidget ? appBar,
    FloatingActionButton ? floatingActionButton,
    Widget ? body,
    void Function(int actualPage, int futurePage, BuildContext context) ? navigationFunction,
  }){
    return NavigationFrame(
      appBar: appBar ?? this.appBar,
      floatingActionButton: floatingActionButton ?? this.floatingActionButton,
      body: body ?? this.body,
      navigationFunction: navigationFunction ?? this.navigationFunction,
    );
  }
}














