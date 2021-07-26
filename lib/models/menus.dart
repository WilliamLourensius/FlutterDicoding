import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './menu.dart';

class Menus with ChangeNotifier {
  List<Menu> _items = [
    // Menu(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //   stock: 30,
    //   servingSise: 5,
    // ),
    // Menu(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    //   stock: 30,
    //   servingSise: 5,
    // ),
    // Menu(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    //   stock: 30,
    //   servingSise: 5,
    // ),
    // Menu(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl: null,
    //   stock: 30,
    //   servingSise: 5,
    // ),
  ];

  List<Menu> get items {
    return [..._items];
  }

  Menu findById(String id) {
    return _items.firstWhere((menu) => menu.id == id); // find the menu
  }

  Future<void> fetchMenu() async {
    const url = 'https://www.rtowilliam.com/api/menuA';
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDlhMGRlYjdlNzNiYjU5NzcxMmI0YWM5NTg5M2IyYTc5NmIwNWJjMzAzN2U5MGRmMDI5ODUxNGMxNDE1YmVhOTFlMmMwYWI3NTQxOThkZTQiLCJpYXQiOjE2MjcyOTY0NzEuNzM3NjkxLCJuYmYiOjE2MjcyOTY0NzEuNzM3Njk4LCJleHAiOjE2NTg4MzI0NzEuNjk4OTMyLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.tfpy6HLGyfvi6uaztdcbi2LI82g2UipkeQRLQT-zm20Y62iXQy9vIt_iZ2HD6nAvvjla_5B5wkHX5ztnn-2ICVBgr6uNyEr961WjKDQw_YDejlaJzZOqJBe-y2ySgo8ekfG8U7INVcSlaENlZ0fobfUgfKl7JisvSwZdZZWurGWtDM2er_nmPTsV1Rcu4GZ4Tw0fI9liwCHQd3WYebDAM_l81wM0xA4WCl3QIP7RVmIhK1EzkpPin0ZzGT-6txGTfKINGzdYOQfGXFbQJqYknKDWISUj-EQNh0-gpDVp_9bLY8wcjX-IjPlGHo-iIa-KL07RNPyokWC-l8tavJAcyc5n-u3yj0v9fMc7554I8hrwG8BiWG8vHKC7rhkTTucwFbwApvFqZn1vUrWKPBXuYKRs2iLb8ybc1kD_sOb-9rPicrBnU2Ros07c46i8rOd4sNT7xMDQZ8UbEwaUuVwJ5IojCTXwTNIZXSlKAbiHFmVb7Y_w2HtF2d3FTRbjQY1HOgx-bOgPwACQiQT8oT3Bw2ZCQQISkiamSRlHGEJfVST8uqfWqwJps3qMdz9ZL2bIYwkzQQpNLkLSzHnFkcIdwOArRlLctcbOz-ewZ6nb07IZIah9A5OqH3g9g2BbSuiAPCxMKZErE6peYs1S0uh3OLkxo5dokXuGdAIo69JKpaY'
        },
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Menu> loadedMenus = [];
      final extractedMenu = extractedData['data'];
      extractedMenu.forEach(
        (menu) => loadedMenus.add(
          Menu(
            id: menu['id'].toString(),
            title: menu['nama_menu'],
            description: menu['deskripsi_menu'],
            price: double.parse(menu['harga_menu'].toString()),
            imageUrl: menu['gambar_menu'],
            servingSise: int.parse(menu['serving_size'].toString()),
            stock: int.parse(menu['sisa_stok'].toString()),
          ),
        ),
      );
      _items = loadedMenus;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
