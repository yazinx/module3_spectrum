import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextScreen extends StatefulWidget {
  @override
  _SpeechToTextScreenState createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech to Text App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_isListening ? 'Listening...' : 'Not Listening'),
            const SizedBox(height: 20.0),
            Text(_text),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _isListening ? stopListening : startListening,
              child: Text(_isListening ? 'Stop Listening' : 'Start Listening'),
            ),
          ],
        ),
      ),
    );
  }

  void startListening() async {
    if (await _speech.initialize()) {
      setState(() {
        _isListening = true;
      });

      _speech.listen(
        onResult: (result) {
          setState(() {
            _text = result.recognizedWords;
          });
        },
        listenFor: Duration(seconds: 10),
      );
    } else {
      setState(() {
        _isListening = false;
        _text = 'Speech recognition not available';
      });
    }
  }

  void stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }
}
