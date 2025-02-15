import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onPickFile;
  final VoidCallback onPickImage;
  final VoidCallback onRecordVoice;
  final bool isRecording;

  MessageInput({
    required this.controller,
    required this.onSend,
    required this.onPickFile,
    required this.onPickImage,
    required this.onRecordVoice,
    required this.isRecording,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          PopupMenuButton<int>(
            icon: Icon(Icons.add),
            onSelected: (value) {
              switch (value) {
                case 0:
                  onPickFile();
                  break;
                case 1:
                  onPickImage();
                  break;
                case 2:
                  onRecordVoice();
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.attach_file),
                    SizedBox(width: 8),
                    Text('File'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.image),
                    SizedBox(width: 8),
                    Text('Image'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(isRecording ? Icons.stop : Icons.mic),
                    SizedBox(width: 8),
                    Text(isRecording ? 'Stop Recording' : 'Record Voice'),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter message',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}