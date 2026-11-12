import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart';
import 'account.dart';
import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';

class Userdata {
  Userdata._();
  static final Userdata instance = Userdata._();
  factory Userdata() => instance; // same data everywhere in the app

  static const _prefsKey = 'chirpy_saved_comments_v1';

  Usercomment _seed(String img, String name, String time, String text) =>
      Usercomment(
          commenterImg: img,
          commenterName: name,
          commentTime: time,
          commentContent: text);

  late final List<Userpost> userList = [
    Userpost(
      id: 'post1',
      userimg: 'assets/images/user1.jpg',
      username: 'Ana Reyes',
      time: '2 hrs ago',
      postcontent: 'Sunset at the beach today!',
      posting: 'assets/images/post1.jpg',
      numshare: '5',
      isLiked: false,
      comments: [
        _seed('assets/images/user2.jpg', 'Ben Cruz', '1 hr ago', 'Looks fun!'),
        _seed('assets/images/user3.jpg', 'Cathy Lim', '30 mins ago',
            'Wish I was there!'),
      ],
    ),
    Userpost(
      id: 'post2',
      userimg: 'assets/images/user2.jpg',
      username: 'Ben Cruz',
      time: '3 hrs ago',
      postcontent: 'Loving the new cafe in town.',
      posting: 'assets/images/post2.jpg',
      numshare: '3',
      isLiked: true,
      comments: [
        _seed('assets/images/user1.jpg', 'Ana Reyes', '2 hrs ago',
            'Let us go together!'),
      ],
    ),
    Userpost(
      id: 'post3',
      userimg: 'assets/images/user3.jpg',
      username: 'Cathy Lim',
      time: '5 hrs ago',
      postcontent: 'Just finished a 10k run!',
      posting: 'assets/images/post3.jpg',
      numshare: '7',
      isLiked: false,
      comments: [
        _seed('assets/images/user4.jpg', 'Dan Tan', '4 hrs ago', 'Great job!'),
      ],
    ),
    Userpost(
      id: 'post4',
      userimg: 'assets/images/user4.jpg',
      username: 'Dan Tan',
      time: '6 hrs ago',
      postcontent: 'Weekend hike with the team.',
      posting: 'assets/images/post4.jpg',
      numshare: '2',
      isLiked: false,
    ),
  ];

  final List<Friend> friendList = [
    Friend(img: 'assets/images/user1.jpg', name: 'Alice'),
    Friend(img: 'assets/images/user2.jpg', name: 'Bob'),
    Friend(img: 'assets/images/user3.jpg', name: 'Charlie'),
    Friend(img: 'assets/images/user4.jpg', name: 'Diana'),
    Friend(img: 'assets/images/user5.jpg', name: 'Ethan'),
    Friend(img: 'assets/images/user6.jpg', name: 'Fiona'),
  ];

  final Account myUserAccount = Account(
    name: 'Terrence Clyde $lastname',
    email: 'tcbc.$lastname@gmail.com'.toLowerCase(),
    img: 'assets/images/me.jpg',
    numFollowers: '1.2k',
    numPosts: '350',
    numFollowing: '500',
    numFriends: '400',
  );

  // ---------- SAVED COMMENTS ----------
  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_prefsKey);
      if (raw == null) return;
      final data = jsonDecode(raw) as Map<String, dynamic>;
      for (final post in userList) {
        final saved = data[post.id];
        if (saved is List) {
          post.comments
            ..clear()
            ..addAll(saved
                .map((e) => Usercomment.fromJson(e as Map<String, dynamic>)));
        }
      }
    } catch (_) {

    }
  }

  Future<void> addComment(Userpost post, String text) async {
    post.comments.add(Usercomment(
      commenterImg: myUserAccount.img,
      commenterName: myUserAccount.name,
      commentTime: _now(),
      commentContent: text.trim(),
    ));
    await _save();
  }

  Future<void> _save() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = {
        for (final p in userList) p.id: p.comments.map((c) => c.toJson()).toList(),
      };
      await prefs.setString(_prefsKey, jsonEncode(data));
    } catch (_) {}
  }

  String _now() {
    const m = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final d = DateTime.now();
    final h = d.hour % 12 == 0 ? 12 : d.hour % 12;
    final min = d.minute.toString().padLeft(2, '0');
    final ap = d.hour >= 12 ? 'PM' : 'AM';
    return '${m[d.month - 1]} ${d.day}, $h:$min $ap';
  }
}