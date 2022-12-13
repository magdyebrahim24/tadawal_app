import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tadawal/core/utils/app_colors.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String message}) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }

  static void showToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        fontSize: 14,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.toastBgColor);
  }

  Widget iconBuilder({required icon , fun}) {
    return IconButton(

        icon:  FaIcon(icon), onPressed: fun);
  }
}
