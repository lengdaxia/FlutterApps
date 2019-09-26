import 'package:e_shop/pages/cart_page.dart';
import 'package:e_shop/pages/category_page.dart';
import 'package:e_shop/pages/detail_page.dart';
import 'package:e_shop/pages/home_page.dart';
import 'package:e_shop/pages/mine_page.dart';
import 'package:flutter/material.dart';


// const Map<String,PageRouter>{
//   "/":(context) => HomePage())
// }
Map<String, WidgetBuilder> appRoutes = {
    // "/":(context) => HomePage(),
    "home":(context) => HomePage(),
    "category":(context) => CategoryPage(),
    "cart":(context) => CartPage(),
    "mine":(context) => MinePage(),
    'detail':(context) => DetailPage(),
};