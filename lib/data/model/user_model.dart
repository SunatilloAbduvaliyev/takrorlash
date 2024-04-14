class UserModel {
  final String name;
  final String age;
  final String image;
  final String userId;
  final String dbId;
  final String storagePath;
  UserModel({
    required this.storagePath,
    required this.userId,
    this.dbId = '',
    required this.name,
    required this.age,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      storagePath: json['storage_path'] as String? ?? '',
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
        'storage_path': storagePath,
      };

  Map<String, dynamic> toUpdateJson() => {
        'name': name,
        'age': age,
        'image': image,
        'storage_path': storagePath,
      };

  UserModel copyWith({
    String? userId,
    String? dbId,
    String? name,
    String? age,
    String? image,
    String? storagePath,
  }) =>
      UserModel(
        storagePath: storagePath?? this.storagePath,
        userId: userId?? this.userId,
        dbId: dbId?? this.dbId,
        name: name ?? this.name,
        age: age ?? this.age,
        image: image ?? this.image,
      );

  static UserModel initialValue() => UserModel(storagePath:'',dbId: ' ' ,userId: '',name: "", age: '', image: '');
}
