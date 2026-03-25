import 'package:flutter/material.dart';

class AppValidator {
  static String? isNotEmpty(String? value){
    if(value == null || value.isEmpty) return "Поле не может быть пустым";
    return null;
  }

  static String? Function(String?) minLength(int min){
    return (String? value) {
      if (value == null || value.isEmpty){
        return "Поле не может быть пустым";
      }  
      if (value.length < min){
        final symbols = _declension(min, "символ", "символа", "символов");
        return "Минимум $min $symbols";
      }
      return null;
    };
  }
  
  static String? Function(String?) equalsController(TextEditingController compareToController){
    return (String? value){
      if(value == null || value.isEmpty){
        return null;
      }
      if (value != compareToController.text){
        return "Пароли не совпадают";
      }
      return null;
    };
  }


  static String? Function(String?) combine(List<String? Function(String?)> validators){
    return (String? value){
      for (final validator in validators){
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }

  static String _declension(int number, String one, String few, String many){
    final num = number.abs() % 100;
    final num10 = num % 10;

    if(num > 10 && num < 20) return many;
    if(num10 > 1 && num10 < 5) return few;
    if(num10 == 1) return one;
    return many;
  }
}