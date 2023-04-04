// ignore: always_use_package_imports
import '../gallery_view.dart';

import 'package:flutter/material.dart';

// ignore: always_use_package_imports
import '../entities/gallery_value.dart';

///
class GalleryBuilder extends StatelessWidget {
  ///
  const GalleryBuilder({
    Key? key,
    required this.controller,
    required this.builder,
    this.child,
  }) : super(key: key);

  ///
  final GalleryController controller;

  ///
  final Widget Function(GalleryValue value, Widget? child) builder;

  ///
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<GalleryValue>(
      valueListenable: controller,
      builder: (ctx, v, c) => builder(v, c),
      child: child,
    );
  }
}
