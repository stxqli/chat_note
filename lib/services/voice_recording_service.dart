import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecorderService {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();

  Future<void> startRecording() async {
    var status = await Permission.microphone.request();
    if (status == PermissionStatus.granted) {
      await _recorder.startRecorder(toFile: 'voice_message.aac');
    }
  }

  Future<void> stopRecording() async {
    await _recorder.stopRecorder();
  }

  Future<void> openSession() async {
    await _recorder.openAudioSession();
  }

  Future<void> closeSession() async {
    await _recorder.closeAudioSession();
  }
}