
class Genre {

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  int id;
  String name;

  @override
  String toString() {
    return 'id: $id, name: $name';
  }
}