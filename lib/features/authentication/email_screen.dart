import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import 'widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _usernameContorller = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();

    _usernameContorller.addListener(() {
      setState(() {
        _username = _usernameContorller.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameContorller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign Up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text("What is your Email?",
                  style: TextStyle(
                      fontSize: Sizes.size24, fontWeight: FontWeight.w700)),
              Gaps.v16,
              TextField(
                controller: _usernameContorller,
                decoration: InputDecoration(
                    hintText: "Email",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400))),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v16,
              FormButton(disabled: _username.isEmpty),
            ],
          ),
        ));
  }
}