class Student {
  final int id;
  final String name;
  final String className;
  final String code;
  final double sb1;
  final double sb2;
  final double sb3;

  Student({
    required this.id,
    required this.name,
    required this.className,
    required this.code,
    required this.sb1,
    required this.sb2,
    required this.sb3,
  });

  Student copyWith({
    int? id,
    String? name,
    String? className,
    String? code,
    double? sb1,
    double? sb2,
    double? sb3,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      className: className ?? this.className,
      code: code ?? this.code,
      sb1: sb1 ?? this.sb1,
      sb2: sb2 ?? this.sb2,
      sb3: sb3 ?? this.sb3,
    );
  }
}
