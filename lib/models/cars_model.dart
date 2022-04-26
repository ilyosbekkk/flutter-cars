import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Car extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String model;
  @HiveField(3)
  final int age;
  final String imgUrl;
  Car({
    required this.id,
    required this.name,
    required this.model,
    required this.age,
    this.imgUrl =
        "https://car-pictures-download.com/wp-content/uploads/Lamborghini-Huracan-luxury-sports-car-2019.jpg",
  });

  Car copyWith({
    int? id,
    String? name,
    String? model,
    int? age,
    String? imgUrl,
  }) {
    return Car(
      id: id ?? this.id,
      name: name ?? this.name,
      model: model ?? this.model,
      age: age ?? this.age,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'model': model,
      'age': age,
    };
  }

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
      model: json['model'] ?? '',
      age: json['age'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'Car(id: $id, name: $name, model: $model, age: $age, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Car &&
        other.id == id &&
        other.name == name &&
        other.model == model &&
        other.age == age &&
        other.imgUrl == imgUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        model.hashCode ^
        age.hashCode ^
        imgUrl.hashCode;
  }
}
