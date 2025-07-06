import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String userName;
  final String? name;
  final String? email;
  final int? userId;
  final List<String> roles;

  const UserEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.userName,
    required this.name,
    required this.email,
    required this.userId,
    required this.roles,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      userName: json['userName'],
      name: json['name'],
      email: json['email'],
      userId: json['userId'],
      roles: List<String>.from(json['roles']),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['userId'] = userId;
    data['userName'] = userName;
    data['name'] = name;
    data['email'] = email;
    data['roles'] = roles;
    return data;
  }

  @override
  List<Object?> get props => [
    accessToken,
    refreshToken,
    userName,
    name,
    email,
    userId,
    roles,
  ];
}

extension UserEntityExtension on UserEntity {
  String get nameAbbreviation {
    if (name == null || name!.isEmpty) return "";

    List<String> parts = name!.split(" ");

    if (parts.length == 1) {
      return parts[0].substring(0, parts[0].length < 2 ? parts[0].length : 2).toUpperCase();
    } else {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
  }
}
