import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Alert {


 static createToastByPassingMessage({required String message}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
