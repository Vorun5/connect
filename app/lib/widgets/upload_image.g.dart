// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class UploadImage extends StatelessWidget {
  const UploadImage({
    Key? key,
    required this.url,
    required this.onChangeUrl,
    this.icon = Icons.add_a_photo_outlined,
  }) : super(key: key);

  final String? url;

  final void Function(String) onChangeUrl;

  final IconData icon;

  @override
  Widget build(BuildContext _context) => _uploadImage(
        _context,
        url: url,
        onChangeUrl: onChangeUrl,
        icon: icon,
      );
}
