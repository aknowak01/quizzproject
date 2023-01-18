import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzproject/blocs/singletons/login_cubit.dart';
import 'package:quizzproject/views/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController nicknameController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Enter your nickname: '),
            TextField(
              controller: nicknameController,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                loginCubit.login(nicknameController.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
