import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/validators/app_validator.dart';
import 'package:flutter_application_1/ui/widgets/button_app.dart';
import 'package:flutter_application_1/ui/widgets/text_field_app.dart';
import 'package:flutter_application_1/domain/models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var loginController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var formKey  = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Регистрация', style: TextStyle(color: Colors.white),), 
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 73, 7, 255),
              ]
            )
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldApp(controller: nameController, hintText: 'Имя', validator: AppValidator.combine([
                AppValidator.isNotEmpty,
                AppValidator.minLength(3),
              ])),

              SizedBox(height: 18,),

              TextFieldApp(controller: loginController, hintText: 'Логин', validator: AppValidator.combine([
                AppValidator.isNotEmpty,
                AppValidator.minLength(5)
              ]),),

              SizedBox(height: 18,),

              TextFieldApp(controller: passwordController, hintText: 'Пароль', isObscure: true, validator: AppValidator.combine([
                AppValidator.isNotEmpty, 
                AppValidator.minLength(6),
                AppValidator.equalsController(confirmPasswordController)
              ]),),

              SizedBox(height: 18,),

              TextFieldApp(controller: confirmPasswordController, hintText: 'Подтвердите пароль', isObscure: true, validator: AppValidator.combine([
                AppValidator.isNotEmpty,
                AppValidator.minLength(6),
                AppValidator.equalsController(passwordController)
              ]),),

              SizedBox(height: 18,),

              ButtonApp(onPressed: register, text: 'Зарегистрироваться',)
            ],
          )
        )
      )
    );
  }

  void register(){
    formKey.currentState!.validate();
    if(nameController.text.isEmpty || loginController.text.isEmpty || passwordController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Поля введены неверно')));
    }
    else if(nameController.text.length <3){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Значения в полях должны быть не короче 3 символов')));
    }
    else if(loginController.text.length < 5 || passwordController.text.length < 5){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Значения в полях должны быть не короче 3 символов')));
    }
    else if (passwordController.text != confirmPasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Пароли не совпадают')));
    }
    else if(users.any((user) => user.login == loginController.text)){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Пользователь с таким логином уже существует')));
    }
    else {
      var user = User(name: nameController.text, login: loginController.text, password: passwordController.text);
      users.add(user);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Вы успешно зарегистрировались!')));
    }
  }
}