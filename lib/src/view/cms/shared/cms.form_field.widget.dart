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
      this.onChanged})
      : super(key: key);

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? label;
  final String? hint;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SizeConfig.verticalSpace),
      child: TextFormField(
          onSaved: onSaved,
          validator: validator,
          onChanged: onChanged,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: label,
            hintText: "asd",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          )),
    );
  }
}
