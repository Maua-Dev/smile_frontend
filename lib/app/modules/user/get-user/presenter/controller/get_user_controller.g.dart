// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetUserController on GetUserControllerBase, Store {
  late final _$userIdAtom =
      Atom(name: 'GetUserControllerBase.userId', context: context);

  @override
  int? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'GetUserControllerBase.state', context: context);

  @override
  GetUserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(GetUserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('GetUserControllerBase.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$GetUserControllerBaseActionController =
      ActionController(name: 'GetUserControllerBase', context: context);

  @override
  dynamic setUserId(int id) {
    final _$actionInfo = _$GetUserControllerBaseActionController.startAction(
        name: 'GetUserControllerBase.setUserId');
    try {
      return super.setUserId(id);
    } finally {
      _$GetUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPageState(GetUserState value) {
    final _$actionInfo = _$GetUserControllerBaseActionController.startAction(
        name: 'GetUserControllerBase.setPageState');
    try {
      return super.setPageState(value);
    } finally {
      _$GetUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateUserId(String? value) {
    final _$actionInfo = _$GetUserControllerBaseActionController.startAction(
        name: 'GetUserControllerBase.validateUserId');
    try {
      return super.validateUserId(value);
    } finally {
      _$GetUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userId: ${userId},
state: ${state}
    ''';
  }
}
