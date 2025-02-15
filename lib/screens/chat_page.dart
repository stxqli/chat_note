import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/message_list.dart';
import '../widgets/message_input.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;

  @override
  void dispose() {
    _recorder.closeAudioSession();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  Future<void> _pickFile() async {
    // TODO: Implement file picking
  }

  Future<void> _pickImage() async {
    // TODO: Implement image picking
  }

  Future<void> _recordVoice() async {
    // TODO: Implement voice recording
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat 2'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageList(messages: _messages),
          ),
          MessageInput(
            controller: _controller,
            onSend: _sendMessage,
            onPickFile: _pickFile,
            onPickImage: _pickImage,
            onRecordVoice: _recordVoice,
            isRecording: _isRecording,
          ),
        ],
      ),
    );
  }
}