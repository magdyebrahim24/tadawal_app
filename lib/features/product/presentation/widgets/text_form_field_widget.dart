import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class OutlineBorderTextFormField extends StatefulWidget {
  FocusNode myFocusNode;
  TextEditingController tempTextEditingController;
  String labelText;
  TextInputType keyboardType;
  bool autofocus = false;
  TextInputAction textInputAction;
  List<TextInputFormatter> inputFormatters;
  Function validation;
  bool checkOfErrorOnFocusChange =
      false; //If true validation is checked when evre focus is changed

  @override
  State<StatefulWidget> createState() {
    return _OutlineBorderTextFormField();
  }

  OutlineBorderTextFormField(
      {super.key,
      required this.labelText,
      required this.autofocus,
      required this.tempTextEditingController,
      required this.myFocusNode,
      required this.inputFormatters,
      required this.keyboardType,
      required this.textInputAction,
      required this.validation,
      required this.checkOfErrorOnFocusChange});
}

class _OutlineBorderTextFormField extends State<OutlineBorderTextFormField> {
  bool isError = false;
  String errorString = "";

  getLabelTextStyle(color) {
    return TextStyle(fontSize: 16.0, color: color, fontWeight: FontWeight.bold,);
  } //label text style

  getTextFieldStyle() {
    return const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  } //textfield style

  getErrorTextFieldStyle() {
    return const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.red,
    );
  } // Error text style

  getBorderColor(isfous) {
    return isfous ? Colors.black : Colors.black54;
  } //Border colors according to focus

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, top: 15.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FocusScope(
            child: Focus(
              onFocusChange: (focus) {
                //Called when ever focus changes
                setState(() {
                  getBorderColor(focus);
                  if (widget.checkOfErrorOnFocusChange &&
                      widget
                          .validation(widget.tempTextEditingController.text)
                          .toString()
                          .isNotEmpty) {
                    isError = true;
                    errorString = widget
                        .validation(widget.tempTextEditingController.text);
                  } else {
                    isError = false;
                    errorString = widget
                        .validation(widget.tempTextEditingController.text);
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.all(Radius.circular(
                            10.0) //                 <--- border radius here
                        ),
                    border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: isError
                          ? Colors.red
                          : getBorderColor(widget.myFocusNode.hasFocus),
                    )),
                child: TextFormField(
                  focusNode: widget.myFocusNode,
                  controller: widget.tempTextEditingController,
                  style: getTextFieldStyle(),
                  autofocus: widget.autofocus,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  inputFormatters: widget.inputFormatters,
                  validator: (string) {
                    if (widget
                        .validation(widget.tempTextEditingController.text)
                        .toString()
                        .isNotEmpty) {
                      setState(() {
                        isError = true;
                        errorString = widget
                            .validation(widget.tempTextEditingController.text);
                      });
                      return "";
                    } else {
                      setState(() {
                        isError = false;
                        errorString = widget
                            .validation(widget.tempTextEditingController.text);
                      });
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: widget.labelText,
                    labelStyle: isError
                        ? getLabelTextStyle(Colors.red)
                        : getLabelTextStyle(Colors.black),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorStyle: const TextStyle(height: 0),
                    focusedErrorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    // hasFloatingPlaceholder: true
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: isError ? true : false,
              child: Container(
                  padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                  child: Text(
                    errorString,
                    style: getErrorTextFieldStyle(),
                  ))),
        ],
      ),
    );
  }
}
