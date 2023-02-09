import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const interests = [
      "Daily Life",
      "Comedy",
      "Entertainment",
      "Animals",
      "Food",
      "Beauty & Style",
      "Drama",
      "Learning",
      "Talent",
      "Sports",
      "Auto",
      "Family",
      "Fitness & Health",
      "DIY & Life Hacks",
      "Arts & Crafts",
      "Dance",
      "Outdoors",
      "Oddly Satisfying",
      "Home & Garden",
      "Daily Life",
      "Comedy",
      "Entertainment",
      "Animals",
      "Food",
      "Beauty & Style",
      "Drama",
      "Learning",
      "Talent",
      "Sports",
      "Auto",
      "Family",
      "Fitness & Health",
      "DIY & Life Hacks",
      "Arts & Crafts",
      "Dance",
      "Outdoors",
      "Oddly Satisfying",
      "Home & Garden",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Choose Your interest!")),
      body: Padding(
          padding: const EdgeInsets.only(
              left: Sizes.size24, right: Sizes.size24, bottom: Sizes.size16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                const Text("Choose your interest",
                    style: TextStyle(
                        fontSize: Sizes.size40, fontWeight: FontWeight.bold)),
                Gaps.v24,
                const Text("Get better vide recommendations",
                    style: TextStyle(fontSize: Sizes.size20)),
                Gaps.v64,
                Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: [
                    for (var interest in interests)
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size16, horizontal: Sizes.size24),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.size32),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 5,
                                    spreadRadius: 5)
                              ]),
                          child: Text(interest,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),
              ],
            ),
          )),
      bottomNavigationBar: BottomAppBar(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: Sizes.size40,
                top: Sizes.size16,
                left: Sizes.size24,
                right: Sizes.size24),
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: const Text('Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: Sizes.size16))),
          )),
    );
  }
}
