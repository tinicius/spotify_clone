import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart' as spotify;

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({Key? key, required this.user}) : super(key: key);

  final spotify.User user;

  @override
  Widget build(BuildContext context) {
    String imageUrl = "";

    if (user.images != null) {
      if (user.images!.isNotEmpty) {
        imageUrl = user.images!.first.url!;
      }
    }

    return Center(
      child: CircleAvatar(
        child: (imageUrl.isNotEmpty)
            ? Image.network(imageUrl)
            : Text(user.displayName!.characters.first),
      ),
    );
  }
}
