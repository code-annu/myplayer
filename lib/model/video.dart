import 'dart:typed_data';

class Video {
  final String id;
  final String title;
  final String parentFolder;
  final Duration? duration;
  final DateTime addedDate;
  final Uint8List?
  thumbnail; // Keeping as bytes for now, path string is also an option
  final int size;
  final String fullPath;
  final String uri;

  Video({
    required this.id,
    required this.title,
    required this.parentFolder,
    this.duration,
    required this.addedDate,
    this.thumbnail,
    required this.size,
    required this.fullPath,
    required this.uri,
  });

  @override
  String toString() {
    return 'Video(title: $title, path: $fullPath, size: $size bytes)';
  }
}
