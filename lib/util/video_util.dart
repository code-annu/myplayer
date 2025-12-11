import 'dart:typed_data';
import 'package:photo_manager/photo_manager.dart';
import '../presentation/dashboard/model/video.dart';

class VideoUtil {
  Future<List<Video>> getVideos() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!ps.isAuth && !ps.hasAccess) {
      // Permission denied
      return [];
    }

    // Fetch video albums (buckets)
    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.video,
    );

    List<Video> videos = [];

    for (var album in albums) {
      // Get all assets in the album
      final List<AssetEntity> assets = await album.getAssetListRange(
        start: 0,
        end: await album.assetCountAsync,
      );

      for (var asset in assets) {
        if (asset.type == AssetType.video) {
          final String title = asset.title ?? 'Unknown';
          final Duration duration = Duration(seconds: asset.duration);
          final DateTime addedDate = asset.createDateTime;
          final Uint8List? thumbnail = await asset.thumbnailData;
          final String? fullPath = await asset.file.then((file) => file?.path);

          if (fullPath != null) {
            // Get the actual file size
            final file = await asset.file;
            final int size = file?.lengthSync() ?? 0;

            // We can use the file path or an ID based URI.
            // For simplicity, we'll use the file path as the URI for now,
            // but in some cases (e.g. Scoped Storage on Android 10+),
            // we might need a content URI or just the file path if using a player that supports it.
            videos.add(
              Video(
                id: asset.id,
                title: title,
                parentFolder: album.name,
                duration: duration,
                addedDate: addedDate,
                thumbnail: thumbnail,
                size: size,
                fullPath: fullPath,
                videoUri: fullPath,
              ),
            );
          }
        }
      }
    }
    return videos;
  }
}
