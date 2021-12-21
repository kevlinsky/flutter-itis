// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostImageAdapter extends TypeAdapter<PostImage> {
  @override
  final int typeId = 1;

  @override
  PostImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostImage(
      fromNet: fields[0] as bool,
      link: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PostImage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fromNet)
      ..writeByte(1)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
