import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:quizzify/utils/const.dart';

class ApiServices {
  Future getQuestions() async {
    try {
      var response = await http.get(Uri.parse(apiURL), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
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
