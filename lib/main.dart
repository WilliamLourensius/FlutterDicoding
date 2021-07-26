import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/menus_overview_screen.dart';
import './screens/menu_detail_screen.dart';

import './models/menus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Menus(),
      child: MaterialApp(
        title: 'AKB Resto',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.amber,
          fontFamily: 'Lato',
        ),
        home: MenusOverviewScreen(),
        routes: {
          MenuDetailScreen.routeName: (ctx) => MenuDetailScreen(),
        },
      ),
    );
  }
}
