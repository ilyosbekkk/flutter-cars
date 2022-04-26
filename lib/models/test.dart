import 'dart:convert';

class Test {
  final String field1;
  final String field2;
  Test({
    required this.field1,
    required this.field2,
  });



  Test copyWith({
    String? field1,
    String? field2,
  }) {
    return Test(
      field1: field1 ?? this.field1,
      field2: field2 ?? this.field2,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'field1': field1,
      'field2': field2,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      field1: map['field1'] ?? '',
      field2: map['field2'] ?? '',
    );
  }

 

  @override
  String toString() => 'Test(field1: $field1, field2: $field2)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Test &&
      other.field1 == field1 &&
      other.field2 == field2;
  }

  @override
  int get hashCode => field1.hashCode ^ field2.hashCode;
}
