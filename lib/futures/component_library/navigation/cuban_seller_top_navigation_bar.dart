import 'package:flutter/material.dart';

class CubanSellerTopNavigationBar extends StatefulWidget implements PreferredSizeWidget{
  const CubanSellerTopNavigationBar({
    super.key,
    required this.theme
  });

  final ThemeData theme;

  @override
  State<CubanSellerTopNavigationBar> createState() => _CubanSellerTopNavigationBarState();

  @override
  Size get preferredSize => Size.fromHeight(56);
}


class _CubanSellerTopNavigationBarState extends State<CubanSellerTopNavigationBar> {
  int selectedIndex = 0;

  void onSelectIndex(int index){
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.theme.colorScheme;

    return SizedBox.expand(
      child: Container(
        color: colors.primary,
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for(final (iconData , label, index) in [
              (Icons.monetization_on_outlined , 'Cuentas'   , 0),
              (Icons.category_sharp           , 'Productos' , 1),
              (Icons.shopping_bag_outlined    ,  'Compras'  , 2),
              (Icons.handshake_outlined       , 'Ventas'    , 3)
            ])

            FilledButton(
              onPressed: () => onSelectIndex(index),
              child: MenuItem(
                iconData: iconData, 
                label: label,
                selected: selectedIndex == index,
                theme: widget.theme
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.iconData,
    required this.label,
    required this.selected,
    required this.theme
  });

  final IconData iconData;
  final String label;

  final bool selected;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final colors = theme.colorScheme;
       
    return (selected) 
    ?Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: colors.onPrimary,),
          Text(label , style: TextStyle(color: colors.onPrimary, fontSize: theme.textTheme.bodyLarge!.fontSize),)
        ],
      ),
    )
    :Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: colors.onPrimary,),
          Text(label , style: TextStyle(color: colors.onPrimary, fontSize: theme.textTheme.bodyMedium!.fontSize),)
        ],
      ),
    );
  }
}