import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'authcubit_state.dart';

class AuthcubitCubit extends Cubit<AuthcubitState> {
  AuthcubitCubit() : super(AuthcubitInitial());
  Future<void> loginuser(
      {required String email, required String password}) async {
    emit(Loginloading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginIsucess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(Loginfail(errormessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(Loginfail(errormessage: 'email-already-in-use'));
      }
    } on Exception catch (e) {
      emit(Loginfail(errormessage: 'some thig wrong try again'));
    }
  }

  Future<void> registeruser(
      {required String email, required String password}) async {
    emit(Signuploading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignupIsucess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(Signupfail(errormessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(Signupfail(errormessage: 'email-already-in-use'));
      }
    } on Exception catch (e) {
      emit(Signupfail(errormessage: 'some thig wrong try again'));
    }
  }
}
