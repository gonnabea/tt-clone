import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formkey.currentState != null) {
      if (_formkey.currentState!.validate()) {
        _formkey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const InterestsScreen(),
            ), (route) {
          // false 리턴할 경우 뒤로가기 라우팅이 안됨
          return false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Gaps.v28,
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please write your Email";
                      }
                      return null;
                    },
                    onSaved: (newValue) => {
                      if (newValue != null) {formData['email'] = newValue}
                    },
                  ),
                  Gaps.v16,
                  TextFormField(
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Please write your password";
                        }
                        return null;
                      },
                      onSaved: (newValue) => {
                            if (newValue != null)
                              {formData['password'] = newValue}
                          }),
                  Gaps.v28,
                  GestureDetector(
                      onTap: _onSubmitTap,
                      child: const FormButton(disabled: false))
                ],
              ))),
    );
  }
}
