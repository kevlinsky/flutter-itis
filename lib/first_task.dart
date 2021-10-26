import 'package:flutter/material.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FirstTaskState createState() => _FirstTaskState();
}

class _FirstTaskState extends State<FirstTask> {
  List<String> _messages = [];

  TextEditingController _textEditingController = TextEditingController();
  FocusNode _textFocusNode = FocusNode();

  void _addMessage(String text) {
    setState(() {
      _messages.add(text);
    });
    _textEditingController.clear();
    FocusScope.of(context).requestFocus(_textFocusNode);
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
                   children: _messages.map((item) {
                     return ListTile(
                     title: Text(
                       item,
                       style: const TextStyle(
                           color: Colors.deepPurple, fontSize: 16),
                     )
                     );
                   }).toList(),
                 )
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        onSubmitted: _addMessage,
                        autofocus: true,
                        focusNode: _textFocusNode,
                      ),
                    ),
                    GestureDetector(
                      child: Icon(Icons.add),
                      onTap: () {
                        _addMessage(_textEditingController.text);
                      },
                    )
                  ],
                ),
              ],
            )
          ),
        )

      ),
    );
  }
}