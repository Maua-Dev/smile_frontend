// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `{schema, select, APPROVED{Approved} PENDING{Pending} REJECTED{Rejected} other{Other}}`
  String stateNameSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'APPROVED': 'Approved',
        'PENDING': 'Pending',
        'REJECTED': 'Rejected',
        'other': 'Other',
      },
      name: 'stateNameSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `Welcome to Clean Flutter Template`
  String get homePageTitle {
    return Intl.message(
      'Welcome to Clean Flutter Template',
      name: 'homePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Explore the features of the template:`
  String get homePageSubtitle {
    return Intl.message(
      'Explore the features of the template:',
      name: 'homePageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Create a new user`
  String get createPageTitle {
    return Intl.message(
      'Create a new user',
      name: 'createPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerTitle {
    return Intl.message(
      'Register',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get fieldName {
    return Intl.message(
      'Name',
      name: 'fieldName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get fieldEmail {
    return Intl.message(
      'Email',
      name: 'fieldEmail',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get fieldId {
    return Intl.message(
      'ID',
      name: 'fieldId',
      desc: '',
      args: [],
    );
  }

  /// `Gabriel de Godoy Braz`
  String get fieldHintName {
    return Intl.message(
      'Gabriel de Godoy Braz',
      name: 'fieldHintName',
      desc: '',
      args: [],
    );
  }

  /// `example@example.com`
  String get fieldHintEmail {
    return Intl.message(
      'example@example.com',
      name: 'fieldHintEmail',
      desc: '',
      args: [],
    );
  }

  /// `Identification number`
  String get fieldHintId {
    return Intl.message(
      'Identification number',
      name: 'fieldHintId',
      desc: '',
      args: [],
    );
  }

  /// `Field is required`
  String get fieldRequired {
    return Intl.message(
      'Field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Field must be at least 6 characters long`
  String get fieldMinLength {
    return Intl.message(
      'Field must be at least 6 characters long',
      name: 'fieldMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Field must be a valid email address`
  String get fieldInvalidEmail {
    return Intl.message(
      'Field must be a valid email address',
      name: 'fieldInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Field must be a valid integer`
  String get fieldInvalidId {
    return Intl.message(
      'Field must be a valid integer',
      name: 'fieldInvalidId',
      desc: '',
      args: [],
    );
  }

  /// `User {successCreateUser} created successfully`
  String successCreateUser(Object placeholders, Object successCreateUser) {
    return Intl.message(
      'User $successCreateUser created successfully',
      name: 'successCreateUser',
      desc: '',
      args: [placeholders, successCreateUser],
    );
  }

  /// `Search for a user`
  String get getPageTitle {
    return Intl.message(
      'Search for a user',
      name: 'getPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchTitle {
    return Intl.message(
      'Search',
      name: 'searchTitle',
      desc: '',
      args: [],
    );
  }

  /// `Update an user`
  String get updatePageTitle {
    return Intl.message(
      'Update an user',
      name: 'updatePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get updateTitle {
    return Intl.message(
      'Update',
      name: 'updateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete an user`
  String get deletePageTitle {
    return Intl.message(
      'Delete an user',
      name: 'deletePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteTitle {
    return Intl.message(
      'Delete',
      name: 'deleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `User {successUpdateUser} updated successfully`
  String successUpdateUser(Object placeholders, Object successUpdateUser) {
    return Intl.message(
      'User $successUpdateUser updated successfully',
      name: 'successUpdateUser',
      desc: '',
      args: [placeholders, successUpdateUser],
    );
  }

  /// `User {successDeleteUser} deleted successfully`
  String successDeleteUser(Object placeholders, Object successDeleteUser) {
    return Intl.message(
      'User $successDeleteUser deleted successfully',
      name: 'successDeleteUser',
      desc: '',
      args: [placeholders, successDeleteUser],
    );
  }

  /// `Field {entityErrorMessage} is not valid`
  String entityErrorMessage(Object placeholders, Object entityErrorMessage) {
    return Intl.message(
      'Field $entityErrorMessage is not valid',
      name: 'entityErrorMessage',
      desc: '',
      args: [placeholders, entityErrorMessage],
    );
  }

  /// `List is empty, no items found for this request`
  String get emptyListErrorMessage {
    return Intl.message(
      'List is empty, no items found for this request',
      name: 'emptyListErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `{message}`
  String requestErrorMessage(Object placeholders, Object message) {
    return Intl.message(
      '$message',
      name: 'requestErrorMessage',
      desc: '',
      args: [placeholders, message],
    );
  }

  /// `No items found for {message}`
  String noItemsFoundErrorMessage(Object placeholders, Object message) {
    return Intl.message(
      'No items found for $message',
      name: 'noItemsFoundErrorMessage',
      desc: '',
      args: [placeholders, message],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
