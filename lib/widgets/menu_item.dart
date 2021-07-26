import 'package:flutter/material.dart';

import '../models/menu.dart';
import '../screens/menu_detail_screen.dart';

class MenuItem extends StatelessWidget {
  final Menu menu;

  MenuItem(this.menu);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              MenuDetailScreen.routeName,
              arguments: menu.id,
            );
          },
          child: Hero(
            tag: menu.id,
            child: FadeInImage(
              placeholder: NetworkImage(
                  'https://www.rtowilliam.com/image/defaultmenu.jpg'),
              image: menu.imageUrl == null
                  ? NetworkImage(
                      'https://www.rtowilliam.com/image/defaultmenu.jpg')
                  : NetworkImage(
                      'https://www.rtowilliam.com/image/' + menu.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            menu.title,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            "Rp. ${menu.price}0",
          ),
        ),
      ),
    );
  }
}
