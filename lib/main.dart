import 'package:chat/Cubit/auth_cubit/authcubit_cubit.dart';
import 'package:chat/Cubit/chatcubit/chat_cubit.dart';

import 'package:chat/scrrens/Signup.dart';
import 'package:chat/scrrens/chatpage.dart';
import 'package:chat/scrrens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const shcolarchat());
}

class shcolarchat extends StatelessWidget {
  const shcolarchat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthcubitCubit(),
        ),
        BlocProvider(create: (context) => ChatCubit()..getmessages())
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => login(),
          Signup.signupid: (context) => Signup(),
          chatpage.chatpageid: (context) => chatpage()
        },
        initialRoute: '/',
      ),
    );
  }
}
