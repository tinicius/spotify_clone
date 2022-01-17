import 'package:spotify/spotify.dart';

class SearchResult {
  String name;
  SearchType type;
  String? image;

  SearchResult({required this.name, required this.type, this.image});
}