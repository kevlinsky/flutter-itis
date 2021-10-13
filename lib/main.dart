import 'package:flutter/material.dart';
import 'package:flutter_itis/first_task.dart';
import 'package:flutter_itis/second_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework project',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Homeworks list'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ListTitle {
  const ListTitle({required this.title, required this.widget});

  final String title;
  final Widget widget;
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListTitle> _homeworks = [
    ListTitle(title: 'First Homework', widget: FirstTask(title: 'First Homework')),
    ListTitle(title: 'Second Homework', widget: SecondTask(title: 'Second Homework')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      children: [
                  Expanded(
                  child: ListView(
              children: _homeworks.map((item) {
      return ListTile(
      title: Text(
      item.title,
      style: const TextStyle(
      color: Colors.green, fontSize: 16),
      ),
      onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => item.widget));
      },
      );
      }).toList(),
    ),
    ),
    ],
    ),
    ))
    ,
    )
    );
  }
}