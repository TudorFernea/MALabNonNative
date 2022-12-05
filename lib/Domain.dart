import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final icons = [Icons.analytics_sharp, Icons.abc_sharp, Icons.apartment_sharp, Icons.api_sharp, Icons.apple_sharp, Icons.architecture_sharp, Icons.auto_graph_sharp, Icons.auto_awesome_sharp];


class Stock{
  static int globalId = 1;
  int id = 0;
  String symbol;
  String desc;
  double buy_price;
  double sell_price;
  IconData icon = Icons.abc_sharp;

 // Stock(this.id, this.symbol, this.desc, this.buy_price, this.sell_price);

  Stock(this.symbol, this.desc, this.buy_price, this.sell_price){
    this.id = globalId;
    this.icon = (icons..shuffle()).first;
    if(this.symbol == "AAPL")
      this.icon = Icons.apple_sharp;
    globalId+=1;
  }
}

class Repository{

  List<Stock> items;

  Repository(this.items);

  void addItem(Stock s){
    items.add(s);
  }

  void removeItem(int id){
    items.removeWhere((element) => element.id == id);
  }

  Stock? getItem(int id){
    for(Stock s in items)
      if(s.id == id)
        return s;
    return null;
  }


}