
import 'package:movies_app/core/errors/error_message_model.dart';


class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException({required this.errorMessageModel});
}


// class LocalDatabaseException