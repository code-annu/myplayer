import 'package:flutter/material.dart';
import '../../../common/widget/video/video_card.dart';
import '../model/video_bucket.dart';

class BucketVideosPage extends StatelessWidget {
  final VideoBucket bucket;

  const BucketVideosPage({super.key, required this.bucket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bucket.name)),
      body: bucket.videos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_library_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No videos in this folder',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
              ),
              itemCount: bucket.videos.length,
              itemBuilder: (context, index) {
                return VideoCard(
                  video: bucket.videos[index],
                  onTap: () {
                    // TODO: Navigate to video player
                    print('Tapped on video: ${bucket.videos[index].title}');
                  },
                );
              },
            ),
    );
  }
}
