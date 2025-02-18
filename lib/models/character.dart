class Character {
  final String name;
  final String height;

  Character ({required this.name, required this.height});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      height: json['height'],
    );
  }
}