import 'package:flutter/foundation.dart';

class Menu {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final int stock;
  final int servingSise;

  Menu({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.stock,
    @required this.servingSise,
  });
}
