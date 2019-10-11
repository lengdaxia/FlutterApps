import 'dart:collection';
import 'package:flutter/material.dart';
import '../provider.dart';

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(builder: (context){
          return Column(
            children: <Widget>[
              Consumer<CartModel>(
                builder: (BuildContext context, cart) => Text("总价：${cart.totalPrice}"),
              ),
              Builder(builder: (context){
                print("RaiseButton build");
                return RaisedButton(
                  child: Text("商品"),
                  onPressed: (){
                    ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(20.0, 1));
                  },
                );
              })
            ],
          );
        }),
      ),
    );
  }
}

class CartModel extends ChangeNotifier{
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(0, (value, item) => value + item.count * item.price);

  void add(Item item){
    _items.add(item);

    notifyListeners();
  }
}


class Item {
  Item(this.price, this.count);

  double price;
  int count;
}