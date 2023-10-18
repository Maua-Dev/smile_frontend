// ignore_for_file: constant_identifier_names

import '../../../generated/l10n.dart';

enum StateEnum {
  APPROVED,
  PENDING,
  REJECTED,
}

extension StateEnumExtension on StateEnum {
  String get typeName {
    return S.current.stateNameSchema(toString());
  }
}
