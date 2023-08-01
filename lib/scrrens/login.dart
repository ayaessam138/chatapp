import 'package:chat/Cubit/auth_cubit/authcubit_cubit.dart';
import 'package:chat/Cubit/chatcubit/chat_cubit.dart';

import 'package:chat/scrrens/Signup.dart';
import 'package:chat/scrrens/chatpage.dart';
import 'package:chat/weidgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../weidgets/custtombutton.dart';
import '../weidgets/snackbar.dart';

class login extends StatelessWidget {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 25, 53),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: BlocConsumer<AuthcubitCubit, AuthcubitState>(
          listener: (context, state) {
            if (state is Loginloading) {
              isloading = true;
            } else if (state is LoginIsucess) {
              BlocProvider.of<ChatCubit>(context).getmessages();
              Navigator.pushNamed(context, chatpage.chatpageid);
              isloading = false;
            } else if (state is Loginfail) {
              showsnackbar(context, state.errormessage!);
              isloading = false;
            }
          },
          builder: (context, state) => ModalProgressHUD(
            inAsyncCall: isloading,
            child: Form(
              key: formkey,
              child: ListView(children: [
                SizedBox(
                  height: 75,
                ),
                Image.asset(
                  'asset/images/scholar.png',
                  height: 100,
                ),
                Center(
                  child: Text(
                    'Scholar caht',
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                textfield(
                  onchanged: (Value) {
                    email = Value;
                  },
                  hinttext: 'Email',
                ),
                SizedBox(
                  height: 10,
                ),
                textfield(
                  text: true,
                  onchanged: (Value) {
                    password = Value;
                  },
                  hinttext: 'Password',
                ),
                SizedBox(
                  height: 20,
                ),
                custombutton(
                  ontap: () async {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<AuthcubitCubit>(context)
                          .loginuser(email: email!, password: password!);

                      // isloading = true;

                      // try {
                      //   await loginuser();

                      //   showsnackbar(context, 'Sucess');
                      // } on FirebaseAuthException catch (e) {
                      //   if (e.code == 'weak-password') {
                      //     showsnackbar(context, 'weak password');
                      //   } else if (e.code == 'email-already-in-use') {
                      //     showsnackbar(context, 'email-already-in-use');
                      //   }
                      // } catch (e) {
                      //   print(e);
                      //   showsnackbar(
                      //       context, 'something wrong, Please Try again');
                      // }
                      // isloading = false;
                      Navigator.pushNamed(context, chatpage.chatpageid,
                          arguments: email);
                    } else {}
                  },
                  text: 'Signup',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do Not have an Acoount? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Signup.signupid);
                        },
                        child: Text('Sign up'))
                  ],
                ),
                SizedBox(
                  height: 75,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
