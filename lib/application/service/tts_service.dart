import 'package:flutter_tts/flutter_tts.dart';
import 'package:injectable/injectable.dart';
import 'package:ottaa_project_flutter/core/repositories/tts_repository.dart';

@Singleton(as: TTSRepository)
class TTSService extends TTSRepository {
  final tts = FlutterTts();

  String language = 'es_AR'; //TODO: Detect
  List<dynamic> availableTTS = [];

  bool customTTSEnable = false;

  double speechRate = 0.4;
  double pitch = 1.0;

  TTSService() {
    initTTS();
  }

  @override
  Future<void> speak(String text) async {
    if (text.isNotEmpty) {
      if (customTTSEnable) {
        await tts.setSpeechRate(speechRate);
        await tts.setPitch(pitch);
      }
      await tts.speak(text);
    }
  }

  Future<void> initTTS() async {
    await tts.setPitch(pitch);
    await tts.setSpeechRate(speechRate);
    await tts.setVolume(1.0);
    await tts.setLanguage(language);
    await tts.awaitSpeakCompletion(true);
    availableTTS = await tts.getLanguages;
  }

  @override
  Future<void> fetchVoices(String languageCode) async {
    final voices = await tts.getVoices;
    print(voices.toString());
    print(availableTTS.toString());
  }
}
