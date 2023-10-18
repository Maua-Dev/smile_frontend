import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:clean_flutter_template/shared/infra/storage/user_local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';

class MockBox extends Mock implements Box {}

void main() {
  UserLocalStorage storage;

  var user = UserModel(
    id: 0,
    name: 'Vitor Soller',
    email: 'gabriel.godoybz@hotmail.com',
    state: StateEnum.APPROVED,
  );

  setUp(() async {
    await Hive.initFlutter();
    final mockBox = MockBox();
    when(mockBox.get(0)).thenAnswer((_) async => user);
  });

  test('[TEST] - all use cases for user storage', () async {
    storage = await UserLocalStorage.instance();
    await storage.createUser(user);
    var userFromStorage = await storage.getUser(0);
    expect(userFromStorage!.id, user.id);

    var userToUpdate = UserModel(
      id: 0,
      name: 'Gabriel Godoy',
      email: 'gabriel.godoybz@hotmail.com',
      state: StateEnum.APPROVED,
    );

    await storage.updateUser(userToUpdate);
    userFromStorage = await storage.getUser(0);
    expect(userFromStorage!.name, userToUpdate.name);

    await storage.deleteUser(0);
    userFromStorage = await storage.getUser(0);
    expect(userFromStorage, null);
  });
}
