import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../../../common/widget/permission/permission_request_widget.dart';
import '../../../common/widget/button/primary_button.dart';
import '../../../common/widget/video/video_card.dart';
import '../../../util/video_util.dart';
import '../model/video.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasPermission = false;
  bool _isLoading = false;
  List<Video> _videos = [];

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    Permission permission;
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        permission = Permission.videos;
      } else {
        permission = Permission.storage;
      }
    } else {
      // Fallback for non-Android platforms or different requirements
      permission = Permission.storage;
    }

    final status = await permission.status;
    if (mounted) {
      setState(() {
        _hasPermission = status.isGranted;
      });
    }
  }

  Future<void> _loadVideos() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final videoUtil = VideoUtil();
      final videos = await videoUtil.getVideos();

      if (mounted) {
        setState(() {
          _videos = videos;
          _isLoading = false;
        });

        // Log the results for verification
        print('Fetched ${videos.length} videos');
        for (var video in videos.take(5)) {
          print(video);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        print('Error loading videos: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Videos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading ? null : _loadVideos,
          ),
        ],
      ),
      body: _hasPermission
          ? _buildVideoContent()
          : PermissionRequestWidget(onPermissionGranted: _checkPermission),
    );
  }

  Widget _buildVideoContent() {
    if (_isLoading && _videos.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_videos.isEmpty) {
      return Center(
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
              'No videos found',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the refresh button to scan for videos',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
            ),
            const SizedBox(height: 24),
            PrimaryButton(onPressed: _loadVideos, text: 'Scan for Videos'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadVideos,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
        ),
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          return VideoCard(
            video: _videos[index],
            onTap: () {
              // TODO: Navigate to video player
              print('Tapped on video: ${_videos[index].title}');
            },
          );
        },
      ),
    );
  }
}
