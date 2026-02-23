import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/main_screen.dart';
import 'package:flutter_application_1/ui/screens/register_screen.dart';
import 'package:flutter_application_1/domain/models/user.dart';
import 'package:flutter_application_1/ui/widgets/button_app.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var loginController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Аутентификация',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            TextField(
              controller: loginController,
              decoration: InputDecoration(hintText: 'Логин'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Пароль',
                focusColor: Colors.blueAccent,
              ),
            ),

            SizedBox(height: 24),
            ButtonApp(onPressed: onLogin, text: 'Войти'),
            GestureDetector(
              onTap: onRegister,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(

                ),
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.black,
                    
                  ),
                ),
                )
            ),
          ],
        ),
      ),
    );
  }

  void onLogin() {
    for (var user in users){
      if (user.login == loginController.text && user.password == passwordController.text){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen(title: 'Главная'),),);
        return;
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Неверный логин или пароль')));
  }

  void onRegister() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
  }
}
