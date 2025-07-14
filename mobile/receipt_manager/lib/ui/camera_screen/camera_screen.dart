import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool isCaptureEnabled = true;

  void _onCapture(BuildContext context, String filePath) {
    if (!isCaptureEnabled) return;
    isCaptureEnabled = false;
    Navigator.pushReplacementNamed(
      context,
      '/invoice',
      arguments: filePath,
    ).then((_) {
      isCaptureEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CameraAwesomeBuilder.awesome(
      availableFilters: [],
      middleContentBuilder: (state) => SizedBox.shrink(),
      previewFit: CameraPreviewFit.contain,
      saveConfig: SaveConfig.photo(
        pathBuilder: (sensors) async {
          final Directory tempDir = await getTemporaryDirectory();

          tempDir.createSync(recursive: true);
          if (sensors.length == 1) {
            final String filePath =
                '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

            return SingleCaptureRequest(filePath, sensors.first);
          } else {
            return MultipleCaptureRequest({
              for (final sensor in sensors)
                sensor:
                    '$tempDir/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
            });
          }
        },
      ),
      onMediaCaptureEvent: (event) async {
        switch (event.captureRequest) {
          case SingleCaptureRequest request:
            {
              final path = request.file!.path;
              final exists = await File(path).exists();
              if (exists) {
                _onCapture(context, path);
                print('📁 File exists!');
              } else {
                print('❌ File not found.');
              }
            }
          case MultipleCaptureRequest _:
            break;
        }
      },
    );
  }
}
