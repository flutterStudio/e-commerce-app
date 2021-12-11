import 'package:e_commerce/src/config/size.config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CMSFromField extends StatelessWidget {
  const CMSFromField(
      {Key? key,
      this.onSaved,
      this.validator,
      this.label,
      this.hint,
      this.onChanged,
      this.inputType = TextInputType.none,
      this.initialValue})
      : super(key: key);

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? label;
  final String? hint;
  final void Function(String)? onChanged;
  final TextInputType? inputType;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SizeConfig.verticalSpace),
      child: TextFormField(
          keyboardType: inputType,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          onChanged: onChanged,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          )),
    );
  }
}
