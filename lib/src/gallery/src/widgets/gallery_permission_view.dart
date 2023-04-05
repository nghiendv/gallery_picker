import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:gallery_picker/assets/icons/custom_icons.dart';

///
class GalleryPermissionView extends StatelessWidget {
  ///
  final GalleryController controller;

  const GalleryPermissionView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: controller.galleryString.request_permission_appBar ??
            AppBar(
              title: Text(controller
                      .galleryString.request_permission_navigation_title ??
                  'Request permission'),
            ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.galleryString.request_permission_image != null)
                Column(
                  children: [
                    controller.galleryString.request_permission_image!,
                    const SizedBox(height: 24),
                  ],
                ),
              Text(
                controller.galleryString.request_permission_title ??
                    'Access Your Album',
                style:
                    controller.galleryString.request_permission_title_textStyle,
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                controller.galleryString.request_permission_description ??
                    'Allow gallary picker to access your album for picking media.',
                textAlign: TextAlign.center,
                style: controller
                    .galleryString.request_permission_description_textStyle,
              ),

              const SizedBox(height: 12),

              // Allow access button
              TextButton(
                onPressed: PhotoManager.openSetting,
                child: Text(
                  controller.galleryString.request_permission_button_title ??
                      'Allow Access',
                  style: controller
                      .galleryString.request_permission_button_title_textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
