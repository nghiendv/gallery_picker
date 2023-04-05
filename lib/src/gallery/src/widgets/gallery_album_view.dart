import 'dart:typed_data';
import 'gallery_permission_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../controllers/gallery_repository.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:gallery_picker/src/gallery/src/entities/gallery_string.dart';

///
class GalleryAlbumView extends StatelessWidget {
  ///
  const GalleryAlbumView({
    Key? key,
    required this.controller,
    required this.onAlbumChange,
    required this.albumsNotifier,
  }) : super(key: key);

  ///
  final GalleryController controller;

  ///
  final ValueSetter<AssetPathEntity> onAlbumChange;

  ///
  final ValueNotifier<AlbumsType> albumsNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AlbumsType>(
      valueListenable: albumsNotifier,
      builder: (context, state, child) {
        // Loading
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Error
        if (state.hasError) {
          if (!state.hasPermission) {
            return GalleryPermissionView(controller: controller);
          }
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(
              state.error ?? 'Something went wrong',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }

        if (state.data?.isEmpty ?? true) {
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: const Text(
              'No data',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
        // Album list
        return Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: controller.setting.albumBackground,
            ),
            CupertinoScrollbar(
              child: ListView.builder(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom +
                        MediaQuery.of(context).padding.top +
                        controller.headerSetting.headerMaxHeight),
                itemCount: state.data!.length,
                itemBuilder: (context, index) {
                  final entity = state.data![index];
                  return _Album(
                    panelSetting: controller.panelSetting,
                    setting: controller.setting,
                    galleryString: controller.galleryString,
                    entity: entity,
                    onPressed: onAlbumChange,
                    color: controller.setting.albumColor,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Album extends StatelessWidget {
  const _Album({
    Key? key,
    required this.entity,
    required this.panelSetting,
    required this.setting,
    required this.galleryString,
    this.onPressed,
    this.color = Colors.grey,
  }) : super(key: key);

  final AssetPathEntity entity;
  final PanelSetting panelSetting;
  final GallerySetting setting;
  final GalleryString galleryString;
  final Color color;
  final Function(AssetPathEntity album)? onPressed;

  @override
  Widget build(BuildContext context) {
    // ignore: omit_local_variable_types
    final int imageSize = setting.albumImageSize ?? 48;
    return ColoredBox(
      color: color,
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onPressed: () {
          onPressed?.call(entity);
        },
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius:
                  setting.albumBorderRadius ?? BorderRadius.circular(8),
              child: Container(
                height: imageSize.toDouble(),
                width: imageSize.toDouble(),
                color: Colors.grey,
                child: FutureBuilder<List<AssetEntity>>(
                  future: entity.getAssetListPaged(0, 1),
                  builder: (context, listSnapshot) {
                    if (listSnapshot.connectionState == ConnectionState.done &&
                        (listSnapshot.data?.isNotEmpty ?? false)) {
                      return FutureBuilder<Uint8List?>(
                        future: listSnapshot.data!.first.thumbDataWithSize(
                            imageSize.toInt() * 5, imageSize.toInt() * 5),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.data != null) {
                            return Image.memory(
                              snapshot.data!,
                              fit: BoxFit.cover,
                            );
                          }

                          return const SizedBox();
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),

            const SizedBox(width: 16.0),

            // Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Album name
                  Text(
                    entity.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ).merge(setting.albumTitleStyle),
                  ),
                  const SizedBox(height: 4.0),
                  // Total photos
                  Text(
                    entity.assetCount.toString(),
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13.0,
                    ).merge(setting.albumSubTitleStyle),
                  ),
                ],
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}
