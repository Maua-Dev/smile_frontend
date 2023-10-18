import 'dart:ui';

import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  test('[TEST] - user', () {
    expect(
      () => User(
        id: 0,
        name: 'Vitor Soller',
        email: 'gabriel.godoybz@hotmail.com',
        state: StateEnum.APPROVED,
      ),
      isNotNull,
    );
  });

  test('[TEST] - throw EntityError with invalid name', () {
    expect(
      () => User(
        name: 'g',
        email: "gabriel.braz@maua.br",
        id: 1,
        state: StateEnum.APPROVED,
      ),
      throwsA(isInstanceOf<EntityError>()),
    );
  });

  test('[TEST] - throw EntityError with invalid email', () {
    expect(
      () => User(
        name: 'gabriel',
        email: "gabriel.braz.com",
        id: 1,
        state: StateEnum.APPROVED,
      ),
      throwsA(isInstanceOf<EntityError>()),
    );
  });
}
