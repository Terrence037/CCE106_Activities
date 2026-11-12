import 'package:flutter/material.dart';
import '../config.dart';
import '../model/usercomment.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';
import 'appimage.dart';
import 'postparts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userdata, required this.userPost});

  final Userdata userdata;
  final Userpost userPost;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _commentCtrl = TextEditingController();
  final _scrollCtrl = ScrollController();

  @override
  void dispose() {
    _commentCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _sendComment() async {
    final text = _commentCtrl.text.trim();
    if (text.isEmpty) return;
    _commentCtrl.clear();

    final saving = widget.userdata.addComment(widget.userPost, text);
    setState(() {}); // show it right away
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          _scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
    await saving; // saved on the device
  }

  Widget userpostdetails(Usercomment c) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Avatar(c.commenterImg, radius: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(c.commenterName, style: nametxtstyle),
                    const SizedBox(height: 3),
                    Text(c.commentContent),
                    const SizedBox(height: 3),
                    Text(c.commentTime,
                        style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _commentBar() => SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            children: [
              Avatar(widget.userdata.myUserAccount.img, radius: 18),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _commentCtrl,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _sendComment(),
                  decoration: InputDecoration(
                    hintText: 'Write a comment...',
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: _sendComment,
                icon: const Icon(Icons.send, color: Colors.teal),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final post = widget.userPost;
    return Scaffold(
      appBar: AppBar(
        title: Text('Post - $lastname'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          // ONE ListView only. Comments are spread into it (no nested ListView)
          Expanded(
            child: ListView(
              controller: _scrollCtrl,
              children: [
                userline(post),
                postimage(post),
                postButtons(
                  userPost: post,
                  onLike: () => setState(() => post.isLiked = !post.isLiked),
                  onComment: () {},
                  onShare: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Shared!')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Comments (${post.numcomments})',
                      style: nametxtstyle),
                ),
                if (post.comments.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(child: Text('No comments yet. Be the first!')),
                  ),
                ...post.comments.map(userpostdetails),
                const SizedBox(height: 12),
              ],
            ),
          ),
          _commentBar(),
        ],
      ),
    );
  }
}