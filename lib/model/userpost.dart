import 'usercomment.dart';

class Userpost {
  final String id; 
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String posting;
  final String numshare;
  bool isLiked;
  final List<Usercomment> comments;

  Userpost({
    required this.id,
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.posting,
    required this.numshare,
    required this.isLiked,
    List<Usercomment>? comments,
  }) : comments = comments ?? [];

  // always matches the real number of comments
  String get numcomments => comments.length.toString();
}