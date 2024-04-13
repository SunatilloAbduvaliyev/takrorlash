class UserModel {
  final String name;
  final String age;
  final String image;
  final String userId;

  UserModel({
    this.userId = '',
    required this.name,
    required this.age,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      age: json['age'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': "",
        'name': name,
        'age': age,
        'image': image,
      };

  Map<String, dynamic> toUpdateJson() => {
        'name': name,
        'age': age,
        'image': image,
      };

  UserModel copyWith({
    String? userId,
    String? name,
    String? age,
    String? image,
  }) =>
      UserModel(
        userId: userId?? this.userId,
        name: name ?? this.name,
        age: age ?? this.age,
        image: image ?? this.image,
      );

  static UserModel initialValue() => UserModel(userId: '',name: "", age: '', image: '');
}
