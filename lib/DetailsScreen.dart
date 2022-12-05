import 'package:flutter/material.dart';
import 'package:untitled/Domain.dart';
import 'package:untitled/UpdateScreen.dart';



class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.stock});

  final Stock stock;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  TextEditingController symbController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController buyController = new TextEditingController();
  TextEditingController sellController = new TextEditingController();

  void _navigateUpdate() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateScreen(stock: widget.stock)),
    );
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.stock.symbol}"),
      ),

      body:
      Center(
      child:
      Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text("Symbol",
              style: TextStyle(fontSize: 24)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text("${widget.stock.symbol}",
                  style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text("Description",
                  style: TextStyle(fontSize: 24)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text("${widget.stock.desc}",
                  style: TextStyle(fontSize: 18)),
            ),
             Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text("Buy price",
                  style: TextStyle(fontSize: 24)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text("${widget.stock.buy_price}",
                  style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text("Sell price",
                  style: TextStyle(fontSize: 24)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text("${widget.stock.sell_price}",
                  style: TextStyle(fontSize: 18)),
            ),
          ]
      ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: _navigateUpdate,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
