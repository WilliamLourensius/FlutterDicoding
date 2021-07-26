import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/menus.dart';

import '../widgets/menu_item.dart';

class MenusOverviewScreen extends StatefulWidget {
  @override
  _MenusOverviewScreenState createState() => _MenusOverviewScreenState();
}

class _MenusOverviewScreenState extends State<MenusOverviewScreen> {
  @override
  void initState() {
    Provider.of<Menus>(context, listen: false).fetchMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AKB Resto',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      body: MenusGrid(),
    );
  }
}

class MenusGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menusData = Provider.of<Menus>(context);
    final menus = menusData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: menus.length,
      itemBuilder: (ctx, i) => MenuItem(menus[i]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
