class UserModel {
  final String name;
  final String age;
  final String image;
  final String userId;
  final String dbId;

  UserModel({
    required this.userId,
    this.dbId = '',
    required this.name,
    required this.age,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      dbId: json['_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      age: json['age'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': "",
        'user_id': userId,
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
    String? dbId,
    String? name,
    String? age,
    String? image,
  }) =>
      UserModel(
        userId: userId?? this.userId,
        dbId: dbId?? this.dbId,
        name: name ?? this.name,
        age: age ?? this.age,
        image: image ?? this.image,
      );

  static UserModel initialValue() => UserModel(dbId: ' ' ,userId: '',name: "", age: '', image: '');
}
