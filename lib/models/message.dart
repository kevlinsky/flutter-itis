import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'message.g.dart';

@RestApi(baseUrl: "https://itis-chat-app-ex.herokuapp.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/chat")
  Future<List<Message>> getMessages();

  @POST("/chat")
  Future<void> addMessage(@Body() Message message);
}

@JsonSerializable()
class Message {
  final String author;
  final String message;

  Message({required this.author, required this.message});

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}