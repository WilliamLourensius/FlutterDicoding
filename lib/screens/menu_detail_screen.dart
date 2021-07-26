import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/menus.dart';

class MenuDetailScreen extends StatelessWidget {
  static const routeName = '/menu-detail';

  @override
  Widget build(BuildContext context) {
    final menuId =
        ModalRoute.of(context).settings.arguments as String; //get the id
    final loadedMenu = Provider.of<Menus>(context, listen: false)
        .findById(menuId); // find by id

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedMenu.title),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                child: Text(
                  loadedMenu.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ),
              ),
              background: Hero(
                tag: loadedMenu.id,
                child: Image.network(
                  'https://www.rtowilliam.com/image/' + loadedMenu.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  'Rp. ${loadedMenu.price}0',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  loadedMenu.description,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 800,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
