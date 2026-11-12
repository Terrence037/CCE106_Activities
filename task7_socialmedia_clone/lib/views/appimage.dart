import 'package:flutter/material.dart';

/// Image.asset with a colored placeholder, so the app never crashes or
/// shows red errors if a picture is missing.
class AppImage extends StatelessWidget {
  const AppImage(this.path,
      {super.key, this.fit = BoxFit.cover, this.width, this.height});

  final String path;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (_, _, _) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        color: Colors.primaries[path.hashCode.abs() % Colors.primaries.length]
            .shade300,
        child: const Icon(Icons.person, color: Colors.white),
      ),
    );
  }
}

/// Round profile picture (always a perfect circle, image centered and cropped).
class Avatar extends StatelessWidget {
  const Avatar(this.path, {super.key, this.radius = 20});

  final String path;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: AppImage(path),
      ),
    );
  }
}