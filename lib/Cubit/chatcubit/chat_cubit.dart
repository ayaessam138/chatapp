import 'package:bloc/bloc.dart';
import 'package:chat/models/meesage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../constant.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(Kmessages);
  void sendmessage({required String message, required email}) {
    messages
        .add({'message': message, 'createdat': DateTime.now(), 'email': email});
  }

  void getmessages() {
    messages.orderBy('createdat', descending: true).snapshots().listen((event) {
      List<messagesmodel> messagelist = [];
      print('fffffffffffffffffffffffmmmmmmmmmmmmmmfffff');
      for (var doc in event.docs) {
        messagelist.add(messagesmodel.fromjsio(doc));
      }
      print('ffffffffffffffffffffffffffff');
      emit(Chatsucess(messagelist: messagelist));
    });
  }
}
