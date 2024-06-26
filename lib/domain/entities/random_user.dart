//La entidad que vamos a usar escondiendo complejidades de los repositorios
class RandomUser {
  RandomUser({
    this.id,
    required this.gender,
    required this.name,
    required this.email,
    required this.picture,
    required this.city,
  });

  int? id;
  String name;
  String gender;
  String email;
  final String picture;
  String city;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'email': email,
      'picture': picture,
      'city': city
    };
  }
}
