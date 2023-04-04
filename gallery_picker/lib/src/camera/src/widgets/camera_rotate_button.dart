import 'camera_builder.dart';
import 'package:flutter/material.dart';
import '../controllers/cam_controller.dart';
import 'package:gallery_picker/assets/icons/custom_icons.dart';

///
class CameraRotateButton extends StatelessWidget {
  ///
  const CameraRotateButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  ///
  final CamController controller;

  @override
  Widget build(BuildContext context) {
    return CameraBuilder(
      controller: controller,
      builder: (value, child) {
        return Container(
          padding: const EdgeInsets.only(top: 10.0),
          width: 54.0,
          alignment: Alignment.center,
          child: value.hideCameraRotationButton
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    controller
                        .switchCameraDirection(value.oppositeLensDirection);
                  },
                  child: const Icon(
                    CustomIcons.cameraRotate,
                    color: Colors.white,
                  ),
                ),
        );
      },
    );
  }
}
