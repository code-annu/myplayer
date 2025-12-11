import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../button/primary_button.dart';

class PermissionRequestWidget extends StatefulWidget {
  final VoidCallback onPermissionGranted;

  const PermissionRequestWidget({super.key, required this.onPermissionGranted});

  @override
  State<PermissionRequestWidget> createState() =>
      _PermissionRequestWidgetState();
}

class _PermissionRequestWidgetState extends State<PermissionRequestWidget>
    with WidgetsBindingObserver {
  bool _isPermanentlyDenied = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissionStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermissionStatus();
    }
  }

  Future<void> _checkPermissionStatus() async {
    Permission permission = await _getPermission();
    final status = await permission.status;

    if (status.isGranted) {
      widget.onPermissionGranted();
    } else if (status.isPermanentlyDenied) {
      setState(() {
        _isPermanentlyDenied = true;
      });
    }
  }

  Future<Permission> _getPermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        return Permission.videos;
      } else {
        return Permission.storage;
      }
    }
    // For iOS and others, you might use Permission.photos or similar
    return Permission.storage;
  }

  Future<void> _requestPermission() async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (_isPermanentlyDenied) {
        await openAppSettings();
      } else {
        Permission permission = await _getPermission();
        final status = await permission.request();
        print("status: $status");

        if (status.isGranted) {
          widget.onPermissionGranted();
        } else if (status.isPermanentlyDenied) {
          setState(() {
            _isPermanentlyDenied = true;
          });
        } else {
          // Handle denied state
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Permission denied. Please grant access to proceed.',
                ),
              ),
            );
          }
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.video_library_rounded,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Access Required',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'We need access to your local videos to display and play them within the app.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: _isPermanentlyDenied ? 'Open Settings' : 'Grant Permission',
              onPressed: _requestPermission,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
