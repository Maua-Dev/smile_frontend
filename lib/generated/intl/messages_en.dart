// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(placeholders, entityErrorMessage) =>
      "Field ${entityErrorMessage} is not valid";

  static String m1(placeholders, message) => "No items found for ${message}";

  static String m2(placeholders, message) => "${message}";

  static String m3(schema) => "${Intl.select(schema, {
            'APPROVED': 'Approved',
            'PENDING': 'Pending',
            'REJECTED': 'Rejected',
            'other': 'Other',
          })}";

  static String m4(placeholders, successCreateUser) =>
      "User ${successCreateUser} created successfully";

  static String m5(placeholders, successDeleteUser) =>
      "User ${successDeleteUser} deleted successfully";

  static String m6(placeholders, successUpdateUser) =>
      "User ${successUpdateUser} updated successfully";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "createPageTitle":
            MessageLookupByLibrary.simpleMessage("Create a new user"),
        "deletePageTitle":
            MessageLookupByLibrary.simpleMessage("Delete an user"),
        "deleteTitle": MessageLookupByLibrary.simpleMessage("Delete"),
        "emptyListErrorMessage": MessageLookupByLibrary.simpleMessage(
            "List is empty, no items found for this request"),
        "entityErrorMessage": m0,
        "fieldEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "fieldHintEmail":
            MessageLookupByLibrary.simpleMessage("example@example.com"),
        "fieldHintId":
            MessageLookupByLibrary.simpleMessage("Identification number"),
        "fieldHintName":
            MessageLookupByLibrary.simpleMessage("Gabriel de Godoy Braz"),
        "fieldId": MessageLookupByLibrary.simpleMessage("ID"),
        "fieldInvalidEmail": MessageLookupByLibrary.simpleMessage(
            "Field must be a valid email address"),
        "fieldInvalidId": MessageLookupByLibrary.simpleMessage(
            "Field must be a valid integer"),
        "fieldMinLength": MessageLookupByLibrary.simpleMessage(
            "Field must be at least 6 characters long"),
        "fieldName": MessageLookupByLibrary.simpleMessage("Name"),
        "fieldRequired":
            MessageLookupByLibrary.simpleMessage("Field is required"),
        "getPageTitle":
            MessageLookupByLibrary.simpleMessage("Search for a user"),
        "homePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Explore the features of the template:"),
        "homePageTitle": MessageLookupByLibrary.simpleMessage(
            "Welcome to Clean Flutter Template"),
        "noItemsFoundErrorMessage": m1,
        "registerTitle": MessageLookupByLibrary.simpleMessage("Register"),
        "requestErrorMessage": m2,
        "searchTitle": MessageLookupByLibrary.simpleMessage("Search"),
        "stateNameSchema": m3,
        "successCreateUser": m4,
        "successDeleteUser": m5,
        "successUpdateUser": m6,
        "updatePageTitle":
            MessageLookupByLibrary.simpleMessage("Update an user"),
        "updateTitle": MessageLookupByLibrary.simpleMessage("Update")
      };
}
