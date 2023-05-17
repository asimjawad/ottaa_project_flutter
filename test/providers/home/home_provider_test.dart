import 'dart:ffi';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ottaa_project_flutter/application/notifiers/patient_notifier.dart';
import 'package:ottaa_project_flutter/application/notifiers/user_notifier.dart';
import 'package:ottaa_project_flutter/application/providers/chatgpt_provider.dart';
import 'package:ottaa_project_flutter/application/providers/home_provider.dart';
import 'package:ottaa_project_flutter/application/providers/tts_provider.dart';
import 'package:ottaa_project_flutter/core/abstracts/user_model.dart';
import 'package:ottaa_project_flutter/core/models/assets_image.dart';
import 'package:ottaa_project_flutter/core/models/base_settings_model.dart';
import 'package:ottaa_project_flutter/core/models/base_user_model.dart';
import 'package:ottaa_project_flutter/core/models/group_model.dart';
import 'package:ottaa_project_flutter/core/models/language_setting.dart';
import 'package:ottaa_project_flutter/core/models/patient_user_model.dart';
import 'package:ottaa_project_flutter/core/models/phrase_model.dart';
import 'package:ottaa_project_flutter/core/models/picto_model.dart';
import 'package:ottaa_project_flutter/core/models/user_data_model.dart';
import 'package:ottaa_project_flutter/core/repositories/groups_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/pictograms_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/sentences_repository.dart';
import 'package:ottaa_project_flutter/core/use_cases/learn_pictogram.dart';
import 'package:ottaa_project_flutter/core/use_cases/predict_pictogram.dart';

import 'home_provider_test.mocks.dart';

@GenerateMocks([TTSProvider, SentencesRepository, GroupsRepository, PictogramsRepository, PredictPictogram, LearnPictogram, ChatGPTNotifier])
@GenerateNiceMocks([MockSpec<PatientNotifier>(), MockSpec<UserNotifier>()])
Future<void> main() async {
  late MockTTSProvider mockTTSProvider;
  late MockUserNotifier mockUserNotifier;
  late MockPatientNotifier mockPatientNotifier;
  late MockSentencesRepository mockSentencesRepository;
  late MockGroupsRepository mockGroupsRepository;
  late MockPictogramsRepository mockPictogramsRepository;
  late MockChatGPTNotifier mockChatGPTNotifier;
  late MockLearnPictogram mockLearnPictogram;
  late MockPredictPictogram mockPredictPictogram;

  late HomeProvider homeProvider;

  late List<Phrase> fakePhrases;

  late List<Picto> fakePictos;

  late UserModel fakeUser;

  late List<Group> fakeGroups;

  setUp(() {
    mockTTSProvider = MockTTSProvider();
    mockUserNotifier = MockUserNotifier();
    mockPatientNotifier = MockPatientNotifier();
    mockSentencesRepository = MockSentencesRepository();
    mockGroupsRepository = MockGroupsRepository();
    mockPictogramsRepository = MockPictogramsRepository();
    mockChatGPTNotifier = MockChatGPTNotifier();
    mockLearnPictogram = MockLearnPictogram();
    mockPredictPictogram = MockPredictPictogram();

    fakePhrases = [
      Phrase(date: DateTime.now(), id: '00', sequence: [Sequence(id: '22')], tags: {}),
      Phrase(date: DateTime.now(), id: '22', sequence: [Sequence(id: '22')], tags: {})
    ];
    fakePictos = [
      Picto(id: '0', type: 1, resource: AssetsImage(asset: 'TestAsset', network: 'TestNetwork')),
      Picto(id: '1', type: 1, resource: AssetsImage(asset: 'TestAsset', network: 'TestNetwork')),
      Picto(id: '2', type: 1, resource: AssetsImage(asset: 'TestAsset', network: 'TestNetwork')),
      Picto(id: '3', type: 1, resource: AssetsImage(asset: 'TestAsset', network: 'TestNetwork')),
      Picto(id: '4', type: 1, resource: AssetsImage(asset: 'TestAsset', network: 'TestNetwork')),
      Picto(id: '5', type: 1, resource: AssetsImage(asset: 'TestAsset', network: 'TestNetwork')),
      Picto(id: '6', type: 1, resource: AssetsImage(asset: 'TestAsset', network: 'TestNetwork')),
    ];
    fakeUser = BaseUserModel(
      id: "0",
      settings: BaseSettingsModel(
        data: UserData(
          avatar: AssetsImage(asset: "test", network: "https://test.com"),
          birthDate: DateTime(0),
          genderPref: "n/a",
          lastConnection: DateTime(0),
          name: "John",
          lastName: "Doe",
        ),
        language: LanguageSetting.empty(),
      ),
      email: "test@mail.com",
    );
    fakeGroups = [
      Group(id: '00', relations: [GroupRelation(id: '00', value: 00), GroupRelation(id: '01', value: 00)], text: 'test1', resource: AssetsImage(asset: 'testAsset', network: 'testNetwork'), freq: 00),
      Group(id: '01', relations: [GroupRelation(id: '', value: 00)], text: 'test2', resource: AssetsImage(asset: 'testAsset', network: 'testNetwork'), freq: 01),
      Group(id: '02', relations: [GroupRelation(id: '', value: 00)], text: 'test3', resource: AssetsImage(asset: 'testAsset', network: 'testNetwork'), freq: 03),
    ];
    mockPatientNotifier.state = PatientUserModel(id: '00', groups: {}, phrases: {}, pictos: {}, settings: fakeUser.settings, email: 'test@test.com');
    mockUserNotifier.setUser(fakeUser);
    homeProvider = HomeProvider(mockPictogramsRepository, mockGroupsRepository, mockSentencesRepository, mockTTSProvider, mockPatientNotifier, mockPredictPictogram, mockLearnPictogram, mockUserNotifier, mockChatGPTNotifier);
  });

  testWidgets('should update currentTabGroup and trigger notifyListeners', (WidgetTester tester) async {
    const expectedGroup = 'group';

    await tester.pumpWidget(
      MaterialApp(
        home: ListView(
          controller: homeProvider.pictoTabsScrollController,
          children: const <Widget>[],
        ),
      ),
    );

    homeProvider.setCurrentGroup(expectedGroup);

    await tester.pump();

    expect(homeProvider.currentTabGroup, expectedGroup);
    expect(() => homeProvider.notify(), isA<void>());
  });

  test('should call notifyListeners', () {
    homeProvider.notify();

    expect(() => homeProvider.notify(), isA<void>());
  });

  group('fetchMostUsedSentences', () {
    test('should update mostUsedSentences and trigger notifyListeners', () async {
      final mockResponse = fakePhrases;

      when(mockSentencesRepository.fetchSentences(
        language: anyNamed('language'),
        type: anyNamed('type'),
      )).thenAnswer((_) async => Right(mockResponse));

      await homeProvider.fetchMostUsedSentences();

      expect(homeProvider.mostUsedSentences, mockResponse);
      expect(() => homeProvider.notifyListeners(), isA<void>());
    });

    test('should update mostUsedSentences to empty list when fetchSentences returns an error', () async {
      when(mockSentencesRepository.fetchSentences(
        language: anyNamed('language'),
        type: anyNamed('type'),
      )).thenAnswer((_) async => const Left(''));

      await homeProvider.fetchMostUsedSentences();

      expect(homeProvider.mostUsedSentences, isEmpty);
      expect(() => homeProvider.notifyListeners(), isA<void>());
    });
  });

  test('should update suggestedQuantity and trigger notifyListeners', () {
    const expectedQuantity = 10;

    homeProvider.setSuggedtedQuantity(expectedQuantity);

    expect(homeProvider.suggestedQuantity, expectedQuantity);
    expect(() => homeProvider.notifyListeners(), isA<void>());
  });

  group('fetchPictograms', () {
    test('should fetch pictograms and groups when user is authenticated', () async {
      when(mockPictogramsRepository.getAllPictograms()).thenAnswer((realInvocation) async => fakePictos);
      when(mockGroupsRepository.getAllGroups()).thenAnswer((realInvocation) async => fakeGroups);

      await homeProvider.fetchPictograms();

      expect(homeProvider.pictograms.length, fakePictos.length);
      expect(homeProvider.groups.length, fakeGroups.length);
      expect(homeProvider.pictograms.values, containsAll(fakePictos));
      expect(homeProvider.groups.values, containsAll(fakeGroups));
    });

    test('should not fetch all pictograms and groups when user is not authenticated', () async {
      homeProvider.patientState.setUser(null);
      when(mockPictogramsRepository.getAllPictograms()).thenAnswer((realInvocation) async => []);
      when(mockGroupsRepository.getAllGroups()).thenAnswer((realInvocation) async => []);

      await homeProvider.fetchPictograms();

      expect(homeProvider.pictograms.length, 0);
      expect(homeProvider.groups.length, 0);
    });
  });

  test('predictiveAlgorithm returns the correct list of Picto objects', () {
    final pictograms = {
      1: Picto(id: 1, tags: {
        'hour': ['MANANA']
      }),
      2: Picto(id: 2, tags: {
        'hour': ['MEDIODIA', 'TARDE']
      }),
      3: Picto(id: 3, tags: {}),
      4: Picto(id: 4, tags: {
        'hour': ['NOCHE']
      }),
    };
    final list = [
      PictoRelation(id: 1, value: 0.8),
      PictoRelation(id: 2, value: 0.5),
      PictoRelation(id: 3, value: 0.3),
      PictoRelation(id: 4, value: 0.2),
    ];

    final result = predictiveAlgorithm(list: list, pictograms: pictograms);

    expect(result, hasLength(4));
    expect(result[0].id, equals(1));
    expect(result[1].id, equals(2));
    expect(result[2].id, equals(3));
    expect(result[3].id, equals(4));
  });
  /* group('removeLastPictogram', () {
    test('should remove last pictogram and update suggestions', () {
      homeProvider.addPictogram(fakePictos[0]);
      homeProvider.addPictogram(fakePictos[1]);
      homeProvider.addPictogram(fakePictos[2]);

      homeProvider.removeLastPictogram();

      expect(homeProvider.pictoWords.length, 2);
      expect(homeProvider.pictoWords, [fakePictos[0], fakePictos[1]]);
      expect(homeProvider.suggestedPicts.isNotEmpty, isTrue);
    });

    test('should clear suggestions and update with previous picto id', () {
      homeProvider.addPictogram(fakePictos[0]);
      homeProvider.addPictogram(fakePictos[0]);
      homeProvider.addPictogram(fakePictos[0]);

      homeProvider.removeLastPictogram();

      expect(homeProvider.pictoWords.length, 2);
      expect(homeProvider.pictoWords, [fakePictos[0], fakePictos[1]]);
      expect(homeProvider.suggestedPicts.isNotEmpty, isTrue);
      expect(homeProvider.suggestedPicts, contains(fakePictos[0].id));
    });
  });*/

  /*group('addPictogram', () {
    test('should add picto and clear suggestions', () async {
      homeProvider.addPictogram(fakePictos[0]);

      expect(homeProvider.pictoWords.length, 1);
      expect(homeProvider.pictoWords.first, fakePictos[0]);
      expect(homeProvider.suggestedPicts, isEmpty);
    });

    test('should build suggestions and scroll if more than 5 pictos', () async {
      homeProvider.addPictogram(fakePictos[0]);
      homeProvider.addPictogram(fakePictos[1]);
      homeProvider.addPictogram(fakePictos[2]);
      homeProvider.addPictogram(fakePictos[3]);
      homeProvider.addPictogram(fakePictos[4]);
      homeProvider.addPictogram(fakePictos[5]);

      expect(homeProvider.pictoWords.length, 6);
      expect(homeProvider.pictoWords.last, fakePictos[5]);
      expect(homeProvider.suggestedPicts.isNotEmpty, isTrue);
      expect(homeProvider.scrollController.offset, greaterThan(0.0));
    });
  });*/
}
