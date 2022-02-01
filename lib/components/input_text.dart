import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputText extends StatelessWidget {
  final TextEditingController? textController;
  final TextInputType? textInputType;
  final String? title;
  final String? hintText;
  final onFieldSubmitted;
  VoidCallback? iconPressed;
  final validator;
  bool? showTitle = true;
  TextCapitalization? textCapitalization = TextCapitalization.none;

  InputText(
      {this.textController,
      this.textInputType,
      this.title,
      this.hintText,
      this.validator,
      VoidCallback? iconPressed,
      bool? showTitle,
      this.onFieldSubmitted,
      TextCapitalization? textCapitalization}) {
    if (showTitle != null) {
      this.showTitle = showTitle;
    }

    if (textCapitalization != null) {
      this.textCapitalization = textCapitalization;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textCapitalization: textCapitalization!,
            textInputAction: TextInputAction.next,
            controller: textController,
            keyboardType: textInputType,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelStyle: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
              hintText: hintText,
              contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 20.0, 0.0),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.circular(5),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffDBE2EA), width: 1.0),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffDBE2EA), width: 1.0),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.circular(5),
              ),
              hintStyle: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
                color: Color(0xffCBCBCB),
              ),
              suffixIcon: IconButton(
                onPressed: iconPressed,
                icon: Icon(Icons.search, color: Colors.black),
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }

  static String? validatorFake(String? value) {
    return null;
  }
}
