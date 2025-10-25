import 'package:flutter/material.dart';
import 'package:unit7_pizzalist/pizza.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

  List<Pizza> pizzasInOrder = [];

  @override
  void initState() {
    super.initState();
    pizzasInOrder.add(Pizza("Pepperoni", 2));
    pizzasInOrder.add(Pizza("Canadian Bacon and Pineapple", 2));

  }

  void _addPizza() {
    // TODO: display add pizza Dialog window
    final TextEditingController toppingsController = TextEditingController();
    int sliderValue = 0;
    // print(pizzasInOrder.toString());
    showDialog<void>(context: context, builder: (BuildContext context) {
      return AlertDialog(
          title: const Text("Add a Pizza"),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: toppingsController,
                        decoration: const InputDecoration(hintText: "Toppings"),
                      ),
                      Slider(
                          label: Pizza.PIZZA_SIZES[sliderValue],
                          value: sliderValue.toDouble(),
                          min: 0,
                          max: (Pizza.PIZZA_PRICES.length - 1).toDouble(),
                          divisions: (Pizza.PIZZA_PRICES.length - 1).toInt(),
                          onChanged: (double newValue) {
                            setState(() {
                              sliderValue = newValue.toInt();
                              //print(sliderValue);
                            });
                          }),
                      ElevatedButton(
                          onPressed: () => {
                            addToOrder(toppingsController.text, sliderValue),
                            Navigator.pop(context)
                          },
                          child: Text("Add to Order")
                      )
                    ]
                );
              }
            )
          );
        }
      );
  }

  void addToOrder(String toppings, int index) {
    Pizza pizza = new Pizza(toppings, index);
    setState(() {
      pizzasInOrder.add(pizza);
      //print(pizzasInOrder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: pizzasInOrder.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pizzasInOrder[index].toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPizza,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}



