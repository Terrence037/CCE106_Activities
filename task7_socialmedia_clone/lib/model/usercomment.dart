class Usercomment {
  final String commenterImg;
  final String commenterName;
  final String commentTime;
  final String commentContent;

  Usercomment({
    required this.commenterImg,
    required this.commenterName,
    required this.commentTime,
    required this.commentContent,
  });

  // used to save comments on the device
  Map<String, dynamic> toJson() => {
        'img': commenterImg,
        'name': commenterName,
        'time': commentTime,
        'content': commentContent,
      };

  factory Usercomment.fromJson(Map<String, dynamic> j) => Usercomment(
        commenterImg: j['img'] as String,
        commenterName: j['name'] as String,
        commentTime: j['time'] as String,
        commentContent: j['content'] as String,
      );
}