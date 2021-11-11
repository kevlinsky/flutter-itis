import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:styled_widget/styled_widget.dart';

import '../models/message.dart';
import '../stores/message_store.dart';

class SecondTask extends StatefulWidget {
  const SecondTask({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SecondTaskState createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _textFocusNode = FocusNode();

  MessageStore _messageStore = Modular.get<MessageStore>();

  @override
  void initState() {
    super.initState();
    _messageStore.getMessages();
  }

  Observer _buildMessages(BuildContext context) {
    return Observer(builder: (context) {
      if (_messageStore.messages.length == 0) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
          reverse: true,
          itemCount: _messageStore.messages.length,
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: ListTile(
                title: Text(_messageStore.reverse[index].author)
                    .fontWeight(FontWeight.bold),
                subtitle: Text(_messageStore.reverse[index].message),
              ),
            );
          },
        );
      }
    });
  }

  void _sendMessage(String text) {
    Message message = Message(author: 'Artyom Elin', message: text);
    _messageStore.addMessage(message);
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text(widget.title)
            .textColor(Colors.white)
            .fontSize(25)
            .fontWeight(FontWeight.bold),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(child: _buildMessages(context)),
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
                        }
                      },
                    )
                  ],
                ),
              ],
            )),
      )),
    );
  }
}
