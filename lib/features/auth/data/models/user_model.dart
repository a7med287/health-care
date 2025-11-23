class UserModel {
  final String id;
  final String username;
  final String email;
  final String usertype;
  final List<String> roles;


  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.usertype,
    required this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      usertype: json['usertype'] ?? '',
      roles: json['roles'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "usertype": usertype,
      "roles": roles,
    };
  }
}
