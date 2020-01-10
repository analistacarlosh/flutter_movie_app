
import 'package:json_annotation/json_annotation.dart';
part 'genre.g.dart';

@JsonSerializable(nullable: false)
class Genre {

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  final int id;
  final String name;

  @override
  String toString() => 'id: $id, name: $name';

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}