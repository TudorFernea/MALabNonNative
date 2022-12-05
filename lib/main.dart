import 'package:flutter/material.dart';
import 'package:untitled/AddScreen.dart';
import 'package:untitled/DetailsScreen.dart';
import 'package:untitled/Domain.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final icons = [Icons.analytics_sharp, Icons.abc_sharp, Icons.apartment_sharp, Icons.api_sharp, Icons.apple_sharp, Icons.architecture_sharp, Icons.auto_graph_sharp, Icons.auto_awesome_sharp];

  final Repository repo = Repository(List<Stock>.generate(1, (index) => Stock( "test", "testdsc", 3, 3)));

  void _navigateAdd() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddScreen(repo: this.repo)),
    );
    setState(() {

    });
  }

  void _navigateDetails(Stock stock) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsScreen(stock: stock)),
    );
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: ListView.builder(

        itemCount: repo.items.length,
        prototypeItem: ListTile(
          title: Text("AAAAAAAAAAAAAAAAAAAAAAAA"),
        ),

        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            child: ListTile(
            title: Text(repo.items[index].symbol),
            leading: Icon(repo.items[index].icon),
            trailing: Text("Buy price: ${repo.items[index].buy_price.toString()}  Sell price: ${repo.items[index].sell_price.toString()}"),
            onTap: () => _navigateDetails(repo.items[index]),
            ),
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Remove"),
                    content: const Text("Are you sure you wish to delete this item?"),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => {Navigator.of(context).pop(true), setState(() {
                            this.repo.removeItem(repo.items[index].id);
                          })},
                          child: const Text("REMOVE")
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("CANCEL"),
                      ),
                    ],
                  );
                },
              );
            },
            direction: DismissDirection.startToEnd,
            onDismissed: (DismissDirection dismissDirection){
          },

        );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAdd,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
