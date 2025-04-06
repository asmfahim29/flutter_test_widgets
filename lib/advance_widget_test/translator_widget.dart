import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatorWidget extends StatefulWidget {
  const TranslatorWidget({super.key});

  @override
  State<TranslatorWidget> createState() => _TranslatorWidgetState();
}

class _TranslatorWidgetState extends State<TranslatorWidget> {
  final TextEditingController _controller = TextEditingController();
  String translated = 'Translation';
  final GoogleTranslator _translator = GoogleTranslator();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() async {
      final text = _controller.text;
      if (text.isNotEmpty) {
        final translation =
        await _translator.translate(text, from: 'en', to: 'bn');
        setState(() {
          translated = translation.text;
        });
      } else {
        setState(() {
          translated = 'Translation';
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Translator',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView(
              children: [
                const Text(
                  'English (US)',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                TextField(
                  controller: _controller,
                  style: TextStyle(fontSize: 19, color: Colors.grey[200]!),
                  decoration: const InputDecoration(
                      filled: false,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: 'Enter text ...',
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500)),
                ),
                const Divider(),
                Text(
                  translated,
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.lightBlueAccent.withOpacity(.8),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
