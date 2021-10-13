import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'message.dart';
import 'message_store.dart';


class SecondTask extends StatefulWidget {
  const SecondTask({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SecondTaskState createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask> {
  RestClient restClient = RestClient(Dio());

  TextEditingController _textEditingController = TextEditingController();
  FocusNode _textFocusNode = FocusNode();

  ScrollController _scrollController = new ScrollController();

  MessageStore _messageStore = MessageStore();

  @override
  void initState() {
    super.initState();
    _messageStore.getMessages();
  }

  Observer _buildMessages(BuildContext context) {
    return Observer(builder: (context) {
      return ListView.builder(
        controller: _scrollController,
        itemCount: _messageStore.messages.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text(
                _messageStore.messages[index].author,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_messageStore.messages[index].message),
            ),
          );
        },
      );
    }
    );
  }

  void _sendMessage(String text) {
    Message message = Message(author: 'Artyom Elin', message: text);
    restClient.addMessage(message);
    _messageStore.addMessage(message);
    _textEditingController.clear();
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
                        child: _buildMessages(context)
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            onSubmitted: _sendMessage,
                            autofocus: false,
                            focusNode: _textFocusNode,
                          ),
                        ),
                        GestureDetector(
                          child: Icon(Icons.send),
                          onTap: () {
                            if (_textEditingController.text != '') {
                              _sendMessage(_textEditingController.text);
                              _scrollController.animateTo(_scrollController
                                  .position.maxScrollExtent, duration: Duration(
                                  milliseconds: 300), curve: Curves.easeOut);
                            }
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
