import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:quizzify/models/que_model.dart';

class ApiServices {
  Future getQuestions() async {


    try {
      final response = await http.get(Uri.parse("https://opentdb.com/api.php?amount=10"));

      if (response.statusCode == 200) {
        return questionModelFromJson(response.body);
      } else {
        Fluttertoast.showToast(
          msg: "Data not found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
