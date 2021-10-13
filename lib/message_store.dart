import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'message.dart';

part 'message_store.g.dart';

class MessageStore = _MessageStore with _$MessageStore;

abstract class _MessageStore with Store{
  @observable
  ObservableList<Message> messages = ObservableList.of([]);

  RestClient client = RestClient(Dio());

  @action
  void getMessages(){
    client.getMessages().then((List<Message> messages) => {
      this.messages = ObservableList.of(messages)
    }).catchError((error) {
      print(error.toString());
    });
  }

  @action
  void addMessage(Message message){
    this.messages.add(message);
  }
}