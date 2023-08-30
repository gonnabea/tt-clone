import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(Sizes.size14)),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("22796 comments"),
          actions: [
            IconButton(
                onPressed: _onClosePressed,
                icon: const FaIcon(FontAwesomeIcons.xmark))
          ],
        ),
        body: ListView.separated(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size10, horizontal: Sizes.size16),
            separatorBuilder: (context, index) => Gaps.v20,
            itemCount: 10,
            itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      child: Text("니꼬"),
                    ),
                    Gaps.h10,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("니꼬",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size14,
                                color: Colors.grey.shade500)),
                        Gaps.v3,
                        const Text(
                            "That's not it i've seen the same thing but also in a cave")
                      ],
                    )),
                    Gaps.h10,
                    Column(
                      children: [
                        FaIcon(FontAwesomeIcons.heart,
                            size: Sizes.size28, color: Colors.grey.shade500),
                        Gaps.v2,
                        const Text(
                          '52.2K',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                )),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.shade500,
                foregroundColor: Colors.white,
                child: const Text("니꼬"),
              )
            ],
          ),
        ),
      ),
    );
  }
}