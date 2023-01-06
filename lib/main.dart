import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final listItems = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return Card(
                child: InkWell(
                    onTap: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text(listItems[index]),
                      //       );
                      //     });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return MySecondPage(listItems[index]);
                      }));
                    },
                    child: Container(
                        height: 60,
                        width: double.infinity,
                        child: Text(listItems[index]))));
          },
        ));
  }
}

class MySecondPage extends StatelessWidget {
  MySecondPage(this.value);
  String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Container(
        color: Colors.lightGreenAccent,
        child: Center(
          child: Text("This is Second Page From: " + value),
        ),
      ),
    );
  }
}