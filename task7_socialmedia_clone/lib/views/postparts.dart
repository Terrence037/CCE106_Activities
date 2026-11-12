import 'package:flutter/material.dart';
import '../model/userpost.dart';
import 'appimage.dart';

const nametxtstyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

Widget userline(Userpost userPost) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Avatar(userPost.userimg, radius: 20),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userPost.username, style: nametxtstyle),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(userPost.time),
                const Text(' . '),
                const Icon(Icons.group, size: 15, color: Colors.grey),
              ],
            ),
          ],
        ),
      ],
    );

Widget postimage(Userpost userPost) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.postcontent),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AppImage(userPost.posting,
                width: double.infinity, height: 350, fit: BoxFit.cover),
          ),
        ],
      ),
    );

Widget postButtons({
  required Userpost userPost,
  required VoidCallback onLike,
  required VoidCallback onComment,
  required VoidCallback onShare,
}) =>
    Column(
      children: [
        const Divider(color: Colors.grey),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: userPost.isLiked ? Colors.blue : Colors.grey,
                ),
                onPressed: onLike,
                icon: const Icon(Icons.thumb_up, size: 20),
                label: const Text('Like'),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.grey),
                onPressed: onComment,
                icon: const Icon(Icons.chat_bubble, size: 20),
                label: Text('Comment (${userPost.numcomments})'),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.grey),
                onPressed: onShare,
                icon: const Icon(Icons.share, size: 20),
                label: Text('Share (${userPost.numshare})'),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );