import 'package:flutter/material.dart';

class CubanSellerSearchBar extends StatefulWidget implements PreferredSizeWidget{
  const CubanSellerSearchBar({
    super.key,
    required this.theme,
    this.mobile = true
  });

  final ThemeData theme;
  final bool mobile;


  @override
  State<CubanSellerSearchBar> createState() => _CubanSellerSearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(56);
}


class _CubanSellerSearchBarState extends State<CubanSellerSearchBar> {
  final _searchBarController = TextEditingController();

  Widget mobileView(BuildContext context){
    return Container(
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SearchBar(
                  controller: _searchBarController,
                  hintText: 'Buscar',
                  shadowColor: WidgetStatePropertyAll(Colors.transparent),
                  
                ),
              ),
          
            ],
          ),
          SizedBox(height: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilterButton(),
              OrderButton()
            ],
          ),
        ],
      ),
    );
  }

  Widget desktopView(BuildContext context){
    return Container(
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SearchBar(
                  controller: _searchBarController,
                  hintText: 'Buscar',
                  shadowColor: WidgetStatePropertyAll(Colors.transparent),                 
                ),
              ),
              SizedBox(width: 8,),
              FilterButton(),
              SizedBox(width: 16,),
              OrderButton()
            ],
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return widget.mobile
    ? mobileView(context)
    : desktopView(context);
  }


}








class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Ordenar"),
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_downward))
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.filter_list),
        Text("Filtros")
      ],
    );
  }
}