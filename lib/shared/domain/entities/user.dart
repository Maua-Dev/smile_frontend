import '../../helpers/errors/errors.dart';
import '../enums/state_enum.dart';

class User {
  final int? id;
  final String name;
  final String email;
  final StateEnum state;

  static const int minNameLenght = 2;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.state,
  }) {
    if (!User.validateName(name)) {
      throw EntityError(message: 'name');
    }
    if (!User.validateEmail(email)) {
      throw EntityError(message: 'email');
    }
  }

  static bool validateName(String name) {
    if (name.length < User.minNameLenght) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String email) {
    RegExp regex = RegExp(
      r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)",
    );
    return regex.hasMatch(email);
  }
}
