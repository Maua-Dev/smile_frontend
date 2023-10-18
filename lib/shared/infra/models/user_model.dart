import '../../domain/entities/user.dart';
import '../../domain/enums/state_enum.dart';

class UserModel extends User {
  UserModel(
      {required super.name,
      required super.email,
      required super.state,
      super.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['user_id'],
        name: json['name'],
        email: json['email'],
        state: StateEnum.values
            .firstWhere((element) => element.name == json['state']));
  }

  static List<UserModel> fromMaps(List array) {
    return array.map((e) => UserModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      'user_id': super.id.toString(),
      'new_name': super.name,
    };
  }

  Map<String, dynamic> toJsonCreate() {
    return {
      'name': super.name,
      'email': super.email,
    };
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    StateEnum? state,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      state: state ?? this.state,
    );
  }
}
