import 'dart:io';

import 'package:flutter/material.dart';

///
/// Setting for gallery picker
///
class GalleryString {
  ///
  const GalleryString({
    this.request_permission_appBar,
    this.request_permission_navigation_title,
    this.request_permission_image,
    this.request_permission_title,
    this.request_permission_title_textStyle,
    this.request_permission_description,
    this.request_permission_description_textStyle,
    this.request_permission_button_title,
    this.request_permission_button_title_textStyle,
  });

  ///
  final PreferredSizeWidget? request_permission_appBar;

  ///
  final String? request_permission_navigation_title;

  ///
  final Image? request_permission_image;

  ///
  final String? request_permission_title;
  final TextStyle? request_permission_title_textStyle;

  ///
  final String? request_permission_description;
  final TextStyle? request_permission_description_textStyle;

  ///
  final String? request_permission_button_title;
  final TextStyle? request_permission_button_title_textStyle;

  ///
  // final String request_permission_button_title;

  /// Helper function
  GalleryString copyWith({
    PreferredSizeWidget? request_permission_appBar,
    String? request_permission_navigation_title,
    Image? request_permission_image,
    String? request_permission_title,
    TextStyle? request_permission_title_textStyle,
    String? request_permission_description,
    TextStyle? request_permission_description_textStyle,
    String? request_permission_button_title,
    TextStyle? request_permission_button_title_textStyle,
  }) {
    return GalleryString(
        request_permission_appBar:
            request_permission_appBar ?? this.request_permission_appBar,
        request_permission_navigation_title:
            request_permission_navigation_title ??
                this.request_permission_navigation_title,
        request_permission_image:
            request_permission_image ?? this.request_permission_image,
        request_permission_title:
            request_permission_title ?? this.request_permission_title,
        request_permission_title_textStyle:
            request_permission_title_textStyle ??
                this.request_permission_title_textStyle,
        request_permission_description: request_permission_description ??
            this.request_permission_description,
        request_permission_description_textStyle:
            request_permission_description_textStyle ??
                this.request_permission_description_textStyle,
        request_permission_button_title: request_permission_button_title ??
            this.request_permission_button_title,
        request_permission_button_title_textStyle:
            request_permission_button_title_textStyle ??
                this.request_permission_button_title_textStyle);
  }
}
