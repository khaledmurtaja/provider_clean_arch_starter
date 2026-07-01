
import '../../domain/entites/user_entity.dart';

class UserModel {
  UserModel({
    required this.accessToken,
    required this.tokenType,
    required this.refreshToken,
    required this.clientId,
    required this.userId,
    required this.userName,
    required this.name,
    required this.nickName,
    required this.roles,
    required this.modules,
    required this.email,
    required this.phoneNumber,
    required this.issuedUTC,
    required this.expiresUTC,
    required this.refreshTokenExpiresUTC,
  });

  late final String accessToken;
  late final String tokenType;
  late final String refreshToken;
  late final String clientId;
  late final int userId;
  late final String userName;
  late final String name;
  late final String nickName;
  late final List<String> roles;
  late final List<Modules> modules;
  late final String email;
  late final String phoneNumber;
  late final String issuedUTC;
  late final String expiresUTC;
  late final String refreshTokenExpiresUTC;

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    clientId = json['client_id'];
    userId = json['userId'];
    userName = json['userName'];
    name = json['name'];
    nickName = json['nickName'];
    roles = List.castFrom<dynamic, String>(json['roles']);
    modules = List.from(json['modules']).map((e) => Modules.fromJson(e)).toList();
    email = json['email'] ?? '';
    phoneNumber = json['phoneNumber'];
    issuedUTC = json['issuedUTC'];
    expiresUTC = json['expiresUTC'];
    refreshTokenExpiresUTC = json['refreshTokenExpiresUTC'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['refresh_token'] = refreshToken;
    data['client_id'] = clientId;
    data['userId'] = userId;
    data['userName'] = userName;
    data['name'] = name;
    data['nickName'] = nickName;
    data['roles'] = roles;
    data['modules'] = modules.map((e) => e.toJson()).toList();
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['issuedUTC'] = issuedUTC;
    data['expiresUTC'] = expiresUTC;
    data['refreshTokenExpiresUTC'] = refreshTokenExpiresUTC;
    return data;
  }

  static UserEntity toEntity(UserModel userModel) {
    return UserEntity(
      accessToken: userModel.accessToken,
      refreshToken: userModel.refreshToken,
      userName: userModel.userName,
      name: userModel.name,
      email: userModel.email,
      userId: userModel.userId,
      roles: userModel.roles,
    );
  }
}

class Modules {
  Modules({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Modules.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}
