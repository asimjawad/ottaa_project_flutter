import 'package:either_dart/either.dart';
import 'package:ottaa_project_flutter/core/models/group_model.dart';
import 'package:ottaa_project_flutter/core/models/picto_model.dart';

abstract class CreatePictoRepository {
  Future<List<Group>> fetchUserGroups({required String languageCode, required String userId});

  Future<Either<String, String>> fetchPhotosFromGlobalSymbols({required String searchText, required String languageCode});
}
