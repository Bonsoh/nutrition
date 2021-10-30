import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/custom/constants.dart';

myInputDecoration({Icon? icon, String? hintText, String? labelText, bool? isDense, String? suffixText, EdgeInsets? padding}) {
  return InputDecoration(
    fillColor: kSecondaryColor,
    filled: true,
    isDense: isDense,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: kSecondaryColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: kPrimaryColor)),
    prefixIcon: icon,
    hintText: hintText,
    labelText: labelText,
    suffixText: suffixText,
    contentPadding: padding,
  );
}
