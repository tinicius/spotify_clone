class Album {
  String name;
  String id;
  List<String> images;

  Album({required this.name, required this.id, required this.images});

  factory Album.fromJson(Map<String, dynamic> json) {
    List<String> images = [];

    json["images"].forEach(
      (element) {
        images.add(element["url"]);
      },
    );

    return Album(name: json["name"], id: json["id"], images: images);
  }
}
