import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<String> {
  LoginCubit() : super('Default_Nickname');

  void login(String nickname) {
    emit(nickname);
  }
}

LoginCubit loginCubit = LoginCubit();