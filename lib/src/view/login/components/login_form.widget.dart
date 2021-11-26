import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:e_commerce/src/view/shared/form_error.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _emailFormField(),
          const SizedBox(height: 30),
          _passwordFormField(),
          const SizedBox(height: 30),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("remember-me".tr),
              const Spacer(),
              GestureDetector(
                child: Text(
                  "forgot-password".tr,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          const SizedBox(height: 20),
          DefaultButton(
            child: Text(
              "continue".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField _passwordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
        } else if (value.length >= 8) {}
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (value.length < 8) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "textField-password-label".tr,
        hintText: "textField-password-hint".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField _emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {},
      validator: (value) {},
      decoration: InputDecoration(
        labelText: "textField-email-label".tr,
        hintText: "textField-email-hint".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
