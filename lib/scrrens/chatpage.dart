import 'package:chat/Cubit/chatcubit/chat_cubit.dart';
import 'package:chat/weidgets/chatbubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant.dart';
import '../models/meesage.dart';

class chatpage extends StatelessWidget {
  static String chatpageid = 'cahtpage';

  TextEditingController controller = TextEditingController();
  final scroll = ScrollController();
  List<messagesmodel> messagelist = [];
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 25, 53),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/scholar.png',
              height: 50,
            ),
            Text('Chat')
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is Chatsucess) {
                  messagelist = state.messagelist;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: scroll,
                  itemCount: messagelist.length,
                  itemBuilder: (context, index) {
                    return messagelist[index].email == email
                        ? chatbubble(usermessage: messagelist[index])
                        : chatbubblefriend(
                            usermessage: messagelist[index],
                          );
                  },
                );
              },
            ),
          ),
          TextField(
            controller: controller,
            onSubmitted: (value) {
              BlocProvider.of<ChatCubit>(context)
                  .sendmessage(message: value, email: email);
              controller.clear();
              scroll.animateTo(0,
                  duration: Duration(seconds: 1), curve: Curves.easeIn);
            },
            decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.send,
                  color: Color.fromARGB(255, 9, 25, 53),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
          )
        ],
      ),
    );
  }
}
