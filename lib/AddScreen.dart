import 'package:flutter/material.dart';
import 'package:untitled/Domain.dart';



class AddScreen extends StatefulWidget {
  const AddScreen({super.key, required this.repo});

  final Repository repo;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  TextEditingController symbController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController buyController = new TextEditingController();
  TextEditingController sellController = new TextEditingController();

  void _addItem() {
    setState(() {

      String symb = symbController.text;
      String desc = descController.text;
      double? buy_price = double.tryParse(buyController.text);
      double? sell_price = double.tryParse(sellController.text);

      if(buy_price == null){
        Navigator.pop(context);
      }
      else
      if(sell_price == null){
        Navigator.pop(context);
      }
      else
      if(symb == ""){
        Navigator.pop(context);
      }
      else{
      this.widget.repo.items.add(Stock(symb,desc,buy_price,sell_price));
      Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a stock"),
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child:
            Text("Symbol"),
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child:
              TextField(
                controller: this.symbController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(20.0),
                hintText: 'Enter a symbol',
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child:
            Text("Description"),
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child:
              TextField(
                controller: this.descController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(20.0),
                hintText: 'Enter a description',
                ),
              ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child:
            Text("Buy price"),
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child:
              TextField(
                controller: this.buyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  hintText: 'Enter buy price',
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child:
            Text("Sell price"),
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child:
              TextField(
                controller: this.sellController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20.0),
                  hintText: 'Enter sell price',
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child:
              TextButton(
                onPressed: _addItem,
                style: TextButton.styleFrom(fixedSize: Size(100, 50), backgroundColor: Colors.blue),
                  child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                )
              )
          )
        ]
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
