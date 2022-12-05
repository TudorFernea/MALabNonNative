import 'package:flutter/material.dart';
import 'package:untitled/Domain.dart';



class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.stock});

  final Stock stock;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  TextEditingController symbController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController buyController = new TextEditingController();
  TextEditingController sellController = new TextEditingController();

   dialogAlert(String msg) async{
     return await showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: const Text("AAAA"),
           content: const Text("AAAAAAA"),
           actions: <Widget>[
             TextButton(
               onPressed: () => Navigator.of(context).pop(false),
               child: const Text("CANCEL"),
             ),
           ],
         );
       });
  }




  void _updateItem() {
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
      else
      {
        this.widget.stock.symbol = symbController.text;
        this.widget.stock.desc = descController.text;
        this.widget.stock.buy_price = double.parse(buyController.text);
        this.widget.stock.sell_price = double.parse(sellController.text);
        Navigator.pop(context);
      }
      // this.widget.repo.items.add(Stock(this.symbController.text,this.descController.text,double.parse(buyController.text),double.parse(sellController.text)));
     // Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update a stock"),
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
                  controller: this.symbController..text = this.widget.stock.symbol,
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
                controller: this.descController..text = this.widget.stock.desc,
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
                  controller: this.buyController..text = this.widget.stock.buy_price.toString(),
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
                  controller: this.sellController..text = this.widget.stock.sell_price.toString(),
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
                    onPressed: _updateItem,
                    style: TextButton.styleFrom(fixedSize: Size(100, 50), backgroundColor: Colors.blue),
                    child: Text(
                      'Update',
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
