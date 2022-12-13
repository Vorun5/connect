import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:app/data/api/api_services.dart';

part 'upload_image.g.dart';

@swidget
Widget _uploadImage({
  required String? url,
  IconData icon = Icons.add_a_photo_outlined,
}) =>
    IconButton(
      onPressed: () async {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: [
            'png',
            'jpeg',
            'jpg',
            'gif',
          ],
          // withData: true,
        );
        await ApiServices.uploadImage(result);
      },
      icon: Icon(
        icon,
        // color: Colors.purple,
        size: 35,
      ),
    );
