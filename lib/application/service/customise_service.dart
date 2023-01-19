import 'dart:convert';
import 'package:ottaa_project_flutter/core/models/group_model.dart';
import 'package:ottaa_project_flutter/core/models/picto_model.dart';
import 'package:ottaa_project_flutter/core/models/shortcuts_model.dart';
import 'package:ottaa_project_flutter/core/repositories/customise_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/server_repository.dart';

class CustomiseService implements CustomiseRepository {
  final ServerRepository _serverRepository;

  CustomiseService(this._serverRepository);

  @override
  Future<EitherVoid> setShortcutsForUser({required Shortcuts shortcuts, required String userId}) async => await _serverRepository.setShortcutsForUser(shortcuts: shortcuts, userId: userId);

  @override
  Future<List<Group>> fetchDefaultGroups({required String languageCode}) async {
    final res = await _serverRepository.getDefaultGroups(languageCode);
    if (res.isRight) {
      print(res.right[0]);
      final json = res.right;
      final List<Group> groups = json.keys.map<Group>((e) {
        final data = Map.from(json[e] as Map<dynamic, dynamic>);
        return Group.fromMap({
          "id": e,
          ...data,
        });
      }).toList();

      return groups;
    } else {
      return [];
    }
  }

  @override
  Future<List<Picto>> fetchDefaultPictos({required String languageCode}) async {
    final res = await _serverRepository.getDefaultPictos(languageCode);
    // final List<dynamic> json = jsonDecode(res.right);
    final re = jsonEncode(res.right);
    final json = jsonDecode(re);
    final List<Picto> groups = json.map((e) => Picto.fromJson(e)).toList();

    return groups;
  }
}
