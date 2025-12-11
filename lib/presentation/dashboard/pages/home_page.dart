import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../../../common/widget/permission/permission_request_widget.dart';
import '../../../common/widget/button/primary_button.dart';
import '../../../common/widget/video/bucket_card.dart';
import '../../../util/video_util.dart';
import '../model/video_bucket.dart';
import 'bucket_videos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasPermission = false;
  bool _isLoading = false;
  List<VideoBucket> _buckets = [];

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

  Future<void> _loadBuckets() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final videoUtil = VideoUtil();
      final buckets = await videoUtil.getVideoBuckets();

      if (mounted) {
        setState(() {
          _buckets = buckets;
          _isLoading = false;
        });

        // Log the results for verification
        print('Fetched ${buckets.length} buckets');
        for (var bucket in buckets) {
          print(bucket);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        print('Error loading buckets: $e');
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
            onPressed: _isLoading ? null : _loadBuckets,
          ),
        ],
      ),
      body: _hasPermission
          ? _buildBucketContent()
          : PermissionRequestWidget(onPermissionGranted: _checkPermission),
    );
  }

  Widget _buildBucketContent() {
    if (_isLoading && _buckets.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_buckets.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.folder_outlined, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No video folders found',
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
            PrimaryButton(onPressed: _loadBuckets, text: 'Scan for Videos'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadBuckets,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _buckets.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: BucketCard(
              bucket: _buckets[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BucketVideosPage(bucket: _buckets[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
