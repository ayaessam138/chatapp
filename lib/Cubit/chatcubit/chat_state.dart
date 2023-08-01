part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class Chatsucess extends ChatState {
  List<messagesmodel> messagelist;
  Chatsucess({required this.messagelist});
}
