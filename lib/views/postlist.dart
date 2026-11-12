import 'package:flutter/material.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';
import 'postparts.dart';
import 'profile_view.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});

  final Userdata userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  Future<void> gotoPage(BuildContext context, Userpost post) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ProfileView(userdata: widget.userdata, userPost: post),
      ),
    );
    if (mounted) setState(() {});
  }

  Widget showPost(Userpost userPost) => Column(
        children: [
          userline(userPost),
          postimage(userPost),
          postButtons(
            userPost: userPost,
            onLike: () => setState(() => userPost.isLiked = !userPost.isLiked),
            onComment: () => gotoPage(context, userPost),
            onShare: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Shared!')),
            ),
          ),
          SizedBox(height: 10, child: Container(color: Colors.grey.shade300)),
          const SizedBox(height: 15),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.userdata.userList.map((userPost) {
        return InkWell(
          onTap: () => gotoPage(context, userPost),
          child: showPost(userPost),
        );
      }).toList(),
    );
  }
}