import 'dart:typed_data';
import 'package:photo_manager/photo_manager.dart';

///
class GallaryEntity {
  ///
  GallaryEntity({
    required this.entity,
    required this.bytes,
  });

  ///
  final AssetEntity entity;

  ///
  final Uint8List bytes;

  @override
  int get hashCode {
    return entity.id.hashCode;
  }

  @override
  bool operator ==(other) {
    if (other is! GallaryEntity) {
      return false;
    }
    return entity.id == other.entity.id;
  }

  @override
  String toString() {
    return 'GallaryEntity{ id:${entity.id} , type: ${entity.type}}';
  }
}
