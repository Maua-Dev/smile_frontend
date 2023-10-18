import 'package:clean_flutter_template/shared/environment/environment_config.dart';
import 'package:dio/dio.dart';

BaseOptions userOptions = BaseOptions(
  baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
  responseType: ResponseType.json,
  connectTimeout: const Duration(milliseconds: 30000),
  receiveTimeout: const Duration(milliseconds: 30000),
);
