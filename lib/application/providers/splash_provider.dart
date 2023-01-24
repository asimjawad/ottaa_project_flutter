import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ottaa_project_flutter/application/notifiers/user_avatar_notifier.dart';
import 'package:ottaa_project_flutter/application/notifiers/user_notifier.dart';
import 'package:ottaa_project_flutter/core/repositories/about_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/auth_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/local_database_repository.dart';

class SplashProvider extends ChangeNotifier {
  final AboutRepository _aboutRepository;
  final AuthRepository _auth;
  final UserAvatarNotifier _avatarNotifier;
  final UserNotifier _userNotifier;
  final LocalDatabaseRepository _hiveRepository;

  SplashProvider(
    this._aboutRepository,
    this._auth,
    this._avatarNotifier,
    this._userNotifier,
    this._hiveRepository,
  );

  Future<bool> checkUserAvatar() => _aboutRepository.isCurrentUserAvatarExist();

  Future<bool> isFirstTime() async {
    return await _hiveRepository.getIntro();
  }

  Future<void> setFirstTime() async {
    await _hiveRepository.setIntro(false);
  }

  Future<bool> fetchUserInformation() async {
    final result = await _aboutRepository.getUserInformation();
    // print(result);
    if (result.isLeft) {
      await _auth.logout();
      return false;
    }
    _avatarNotifier.changeAvatar(int.tryParse(result.right.settings.data.avatar.asset) ?? 615);
    _userNotifier.setUser(result.right);
    return result.isRight;
  }
}

final splashProvider = ChangeNotifierProvider<SplashProvider>((ref) {
  final AboutRepository aboutService = GetIt.I.get<AboutRepository>();
  final AuthRepository authService = GetIt.I.get<AuthRepository>();
  final LocalDatabaseRepository localDatabaseRepository = GetIt.I.get<LocalDatabaseRepository>();
  final UserAvatarNotifier avatarNotifier = ref.read(userAvatarNotifier.notifier);
  final UserNotifier userState = ref.read(userNotifier.notifier);
  return SplashProvider(
    aboutService,
    authService,
    avatarNotifier,
    userState,
    localDatabaseRepository,
  );
});
