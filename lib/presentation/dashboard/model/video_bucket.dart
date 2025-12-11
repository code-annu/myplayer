import 'video.dart';

class VideoBucket {
  final String id;
  final String name;
  final List<Video> videos;

  VideoBucket({required this.id, required this.name, required this.videos});

  int get videoCount => videos.length;

  @override
  String toString() {
    return 'VideoBucket(id: $id, name: $name, videoCount: $videoCount)';
  }
}
