class Subtitle {
  String text;
  List<String?> media;
  Subtitle(
    {required this.text, 
    required this.media});
}

class PostData {
  String name;
  String username;
  Subtitle subtitle;
  String profilePhoto;
  PostData(
      {required this.name,
      required this.username,
      required this.subtitle,
      required this.profilePhoto});
}
