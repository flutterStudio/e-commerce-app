import 'package:e_commerce/src/controller/login.controller.dart';
import 'package:e_commerce/src/model/user.model.dart';
import 'package:e_commerce/src/view/shared/default_button.dart';
import 'package:e_commerce/src/view/shared/error_message.widget.dart';
import 'package:e_commerce/src/view/shared/request_handler.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

class LoginForm extends GetView<LoginController> {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
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
          Obx(() {
            return RequestHandler<User>(
                onSuccess: (context, value) {
                  return const Text("Logged in successfully");
                },
                onFailed: (error) => ErrorMessage(
                      errors: [error],
                    ),
                data: controller.loginStatus.value);
          }),
          Row(
            children: [
              Obx(() => Checkbox(
                    value: controller.remember.value,
                    activeColor: Theme.of(context).colorScheme.primary,
                    onChanged: (value) {
                      controller.remember.value = !controller.remember.value;
                    },
                  )),
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
                controller.login();
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
      onSaved: (newValue) => controller.password.value = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
        } else if (value.length >= 8) {}
      },
      validator: (value) {
        if (value == null) {
          return "message-required-field".tr;
        }
        if (value.isEmpty) {
          return "message-required-field".tr;
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
      onSaved: (newValue) => controller.email.value = newValue,
      validator: (value) {
        if (value != null) {
          return GetUtils.isEmail(value) ? null : "error-invalid-email".tr;
        }
        return "message-required-field".tr;
      },
      decoration: InputDecoration(
        labelText: "textField-email-label".tr,
        hintText: "textField-email-hint".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
