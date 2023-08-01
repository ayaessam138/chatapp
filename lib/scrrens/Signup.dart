import 'package:chat/Cubit/auth_cubit/authcubit_cubit.dart';
import 'package:chat/scrrens/chatpage.dart';
import 'package:chat/weidgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../weidgets/custtombutton.dart';
import '../weidgets/textfield.dart';

class Signup extends StatelessWidget {
  static String signupid = 'signup';
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthcubitCubit, AuthcubitState>(
      listener: (context, state) {
        if (state is Signuploading) {
          isloading = true;
        } else if (state is SignupIsucess) {
          Navigator.pushNamed(context, chatpage.chatpageid);
          isloading = false;
        } else if (state is Signupfail) {
          showsnackbar(context, state.errormessage!);
          isloading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 9, 25, 53),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formkey,
                child: ListView(children: [
                  SizedBox(height: 75),
                  Image.asset('asset/images/scholar.png', height: 100),
                  Center(
                    child: Text(
                      'Scholar caht',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Signup',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textfield(
                    onchanged: (data) {
                      email = data;
                    },
                    hinttext: 'Email',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textfield(
                    text: true,
                    onchanged: (data) {
                      password = data;
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
                            .registeruser(email: email!, password: password!);
                        Navigator.pushNamed(context, chatpage.chatpageid);
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
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text('Login'))
                    ],
                  ),
                  SizedBox(height: 75),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
