// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeleteUserController on DeleteUserControllerBase, Store {
  late final _$userIdAtom =
      Atom(name: 'DeleteUserControllerBase.userId', context: context);

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
      Atom(name: 'DeleteUserControllerBase.state', context: context);

  @override
  DeleteUserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(DeleteUserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('DeleteUserControllerBase.deleteUser', context: context);

  @override
  Future<void> deleteUser() {
    return _$deleteUserAsyncAction.run(() => super.deleteUser());
  }

  late final _$DeleteUserControllerBaseActionController =
      ActionController(name: 'DeleteUserControllerBase', context: context);

  @override
  dynamic setUserId(int id) {
    final _$actionInfo = _$DeleteUserControllerBaseActionController.startAction(
        name: 'DeleteUserControllerBase.setUserId');
    try {
      return super.setUserId(id);
    } finally {
      _$DeleteUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPageState(DeleteUserState value) {
    final _$actionInfo = _$DeleteUserControllerBaseActionController.startAction(
        name: 'DeleteUserControllerBase.setPageState');
    try {
      return super.setPageState(value);
    } finally {
      _$DeleteUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateUserId(String? value) {
    final _$actionInfo = _$DeleteUserControllerBaseActionController.startAction(
        name: 'DeleteUserControllerBase.validateUserId');
    try {
      return super.validateUserId(value);
    } finally {
      _$DeleteUserControllerBaseActionController.endAction(_$actionInfo);
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
