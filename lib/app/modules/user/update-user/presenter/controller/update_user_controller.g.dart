// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateUserController on UpdateUserControllerBase, Store {
  late final _$userNameAtom =
      Atom(name: 'UpdateUserControllerBase.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$userEmailAtom =
      Atom(name: 'UpdateUserControllerBase.userEmail', context: context);

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$userIdAtom =
      Atom(name: 'UpdateUserControllerBase.userId', context: context);

  @override
  int get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'UpdateUserControllerBase.state', context: context);

  @override
  UpdateUserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UpdateUserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$updateUserAsyncAction =
      AsyncAction('UpdateUserControllerBase.updateUser', context: context);

  @override
  Future<void> updateUser() {
    return _$updateUserAsyncAction.run(() => super.updateUser());
  }

  late final _$UpdateUserControllerBaseActionController =
      ActionController(name: 'UpdateUserControllerBase', context: context);

  @override
  dynamic setUserName(String name) {
    final _$actionInfo = _$UpdateUserControllerBaseActionController.startAction(
        name: 'UpdateUserControllerBase.setUserName');
    try {
      return super.setUserName(name);
    } finally {
      _$UpdateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserEmail(String email) {
    final _$actionInfo = _$UpdateUserControllerBaseActionController.startAction(
        name: 'UpdateUserControllerBase.setUserEmail');
    try {
      return super.setUserEmail(email);
    } finally {
      _$UpdateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserId(int id) {
    final _$actionInfo = _$UpdateUserControllerBaseActionController.startAction(
        name: 'UpdateUserControllerBase.setUserId');
    try {
      return super.setUserId(id);
    } finally {
      _$UpdateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPageState(UpdateUserState value) {
    final _$actionInfo = _$UpdateUserControllerBaseActionController.startAction(
        name: 'UpdateUserControllerBase.setPageState');
    try {
      return super.setPageState(value);
    } finally {
      _$UpdateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateUserName(String? value) {
    final _$actionInfo = _$UpdateUserControllerBaseActionController.startAction(
        name: 'UpdateUserControllerBase.validateUserName');
    try {
      return super.validateUserName(value);
    } finally {
      _$UpdateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateUserEmail(String? value) {
    final _$actionInfo = _$UpdateUserControllerBaseActionController.startAction(
        name: 'UpdateUserControllerBase.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$UpdateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateUserId(String? value) {
    final _$actionInfo = _$UpdateUserControllerBaseActionController.startAction(
        name: 'UpdateUserControllerBase.validateUserId');
    try {
      return super.validateUserId(value);
    } finally {
      _$UpdateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
userEmail: ${userEmail},
userId: ${userId},
state: ${state}
    ''';
  }
}
