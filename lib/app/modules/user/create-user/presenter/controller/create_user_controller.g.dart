// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateUserController on CreateUserControllerBase, Store {
  late final _$userNameAtom =
      Atom(name: 'CreateUserControllerBase.userName', context: context);

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
      Atom(name: 'CreateUserControllerBase.userEmail', context: context);

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

  late final _$userStateAtom =
      Atom(name: 'CreateUserControllerBase.userState', context: context);

  @override
  StateEnum get userState {
    _$userStateAtom.reportRead();
    return super.userState;
  }

  @override
  set userState(StateEnum value) {
    _$userStateAtom.reportWrite(value, super.userState, () {
      super.userState = value;
    });
  }

  late final _$userIdAtom =
      Atom(name: 'CreateUserControllerBase.userId', context: context);

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'CreateUserControllerBase.state', context: context);

  @override
  CreateUserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CreateUserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$createUserAsyncAction =
      AsyncAction('CreateUserControllerBase.createUser', context: context);

  @override
  Future<void> createUser() {
    return _$createUserAsyncAction.run(() => super.createUser());
  }

  late final _$CreateUserControllerBaseActionController =
      ActionController(name: 'CreateUserControllerBase', context: context);

  @override
  dynamic setUserName(String name) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setUserName');
    try {
      return super.setUserName(name);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserEmail(String email) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setUserEmail');
    try {
      return super.setUserEmail(email);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPageState(CreateUserState value) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setPageState');
    try {
      return super.setPageState(value);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateUserName(String? value) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.validateUserName');
    try {
      return super.validateUserName(value);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateUserEmail(String? value) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
userEmail: ${userEmail},
userState: ${userState},
userId: ${userId},
state: ${state}
    ''';
  }
}
