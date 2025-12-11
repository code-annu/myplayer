import 'dart:typed_data';

class Video {
  final String id;
  final String title;
  final String parentFolder;
  final Duration duration;
  final DateTime addedDate;
  final Uint8List? thumbnail;
  final int size;
  final String fullPath;
  // This could be a file URI or content URI depending on the platform/library usage
  final String videoUri;

  Video({
    required this.id,
    required this.title,
    required this.parentFolder,
    required this.duration,
    required this.addedDate,
    this.thumbnail,
    required this.size,
    required this.fullPath,
    required this.videoUri,
  });

  @override
  String toString() {
    return 'Video(id: $id, title: $title, path: $fullPath, duration: $duration)';
  }
}
