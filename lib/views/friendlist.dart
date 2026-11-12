import 'package:flutter/material.dart';
import '../model/friend.dart';
import '../model/userdata.dart';
import 'appimage.dart';

class Friendlist extends StatelessWidget {
  const Friendlist({super.key, required this.userdata});

  final Userdata userdata;

  final followTxtStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  // FIX (photo alignment): every photo is cropped to the same rounded box
  // (BoxFit.cover) and the name is centered under it with the same spacing.
  Widget friend(Friend friend) => Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AppImage(
                friend.img,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            friend.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      );

  // FIX (list view bug): the grid no longer scrolls by itself. It sits inside
  // the page's ONE scroll view, so finger drags always scroll the whole page.
  Widget friendsListGrid() => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.85,
        ),
        itemCount: userdata.friendList.length,
        itemBuilder: (BuildContext ctx, index) => friend(userdata.friendList[index]),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(children: [Text('Friends', style: followTxtStyle)]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(children: [Text('${userdata.friendList.length} Friends')]),
        ),
        const SizedBox(height: 10),
        friendsListGrid(), // no fixed 380px height anymore
        SizedBox(height: 10, child: Container(color: Colors.grey)),
      ],
    );
  }
}