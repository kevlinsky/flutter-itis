import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ListTitle {
  const ListTitle({required this.title, required this.route});

  final String title;
  final String route;
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListTitle> _homeworks = [
    ListTitle(title: 'Single chat', route: '/first-task/'),
    ListTitle(title: 'API chat', route: '/second-task/'),
    ListTitle(title: 'Image gallery', route: '/third-task/')
  ];

  @override
  void initState(){
    super.initState();
    Firebase.initializeApp();
  }

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
                              print(item.route);
                              Modular.to.pushNamed(item.route, arguments: item.title);
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => item.widget));
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