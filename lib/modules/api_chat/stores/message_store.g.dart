// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MessageStore on _MessageStore, Store {
  Computed<ObservableList<Message>>? _$reverseComputed;

  @override
  ObservableList<Message> get reverse => (_$reverseComputed ??=
          Computed<ObservableList<Message>>(() => super.reverse,
              name: '_MessageStore.reverse'))
      .value;

  final _$messagesAtom = Atom(name: '_MessageStore.messages');

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$_MessageStoreActionController =
      ActionController(name: '_MessageStore');

  @override
  void getMessages() {
    final _$actionInfo = _$_MessageStoreActionController.startAction(
        name: '_MessageStore.getMessages');
    try {
      return super.getMessages();
    } finally {
      _$_MessageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMessage(Message message) {
    final _$actionInfo = _$_MessageStoreActionController.startAction(
        name: '_MessageStore.addMessage');
    try {
      return super.addMessage(message);
    } finally {
      _$_MessageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages},
reverse: ${reverse}
    ''';
  }
}
