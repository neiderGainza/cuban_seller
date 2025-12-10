import 'package:flutter/material.dart';

class CubanSellerBottomNavigationBar extends StatefulWidget{
  const CubanSellerBottomNavigationBar({
    super.key,
    required this.theme,
    required this.navigationFunction
  });

  final ThemeData theme;
  final void Function(int actualPage, int futurePage, BuildContext context) navigationFunction;

  @override
  State<CubanSellerBottomNavigationBar> createState() => _CubanSellerBottomNavigationBarState();
}


class _CubanSellerBottomNavigationBarState extends State<CubanSellerBottomNavigationBar> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    final colors = widget.theme.colorScheme;
    
    return BottomNavigationBar(
      // definir estilos
      selectedItemColor: colors.onPrimary,
      unselectedItemColor: colors.onPrimary,
      selectedFontSize: 16,

      showUnselectedLabels: true,
      
      onTap: (index){
        widget.navigationFunction(selectedIndex, index, context);
        selectedIndex = index;
        setState((){});
      },
      currentIndex: selectedIndex,

      items: <BottomNavigationBarItem>[
        for(final (icon , label) in [
          (Icon(Icons.monetization_on_outlined), 'Cuentas'   ),
          (Icon(Icons.category_sharp)          , 'Productos' ),
          (Icon(Icons.shopping_bag_outlined)   ,  'Compras'  ),
          (Icon(Icons.handshake_outlined)      , 'Ventas'    )
        ])
        BottomNavigationBarItem(icon: icon, label: label, backgroundColor: colors.primary),
      ],
    );
  }
}