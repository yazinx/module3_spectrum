import 'package:flutter/material.dart';
import 'package:module3_spectrum/Text_to_speech/text_to_speech.dart';
import 'package:module3_spectrum/speech_to_text/speech_to_text.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:TextToSpeech());
  }
}
