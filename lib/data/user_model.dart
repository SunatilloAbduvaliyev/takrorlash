class UserModel {
  final String name;
  final String uid;

  UserModel({
    required this.name,
    required this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String? ?? '',
        uid: json['uid'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
      };

  static UserModel initialValue() => UserModel(name: '', uid: '');

  UserModel copyWith({
    String? name,
    String? uid,
}) => UserModel(
        name: name ?? this.name,
        uid: uid ?? this.uid,
      );
}
