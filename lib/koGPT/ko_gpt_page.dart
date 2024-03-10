import 'package:flutter/material.dart';
import 'package:chat_sudaman_app/koGPT/ko_gpt_service.dart';

// KoGPTService 인스턴스 생성 및 의존성 주입
final koGPTService = KoGPTService();

class KoGPTPage extends StatefulWidget {
  const KoGPTPage({Key? key}) : super(key: key);

  @override
  State<KoGPTPage> createState() => _KoGPTPageState();
}

class _KoGPTPageState extends State<KoGPTPage> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_textController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String message) async {
  setState(() {
    _messages.insert(0, message);
    _textController.clear();
  });

  // KoGPTService의 search 메서드 호출
  final response = await koGPTService.search(message);

  // 응답이 있는지 및 generatedText가 null이 아닌지 확인하고 처리
  if (response['generations'] != null && response['generations'][0]['text'] != null) {
    final String generatedText = response['generations'][0]['text'];
    setState(() {
      _messages.insert(0, generatedText);
    });
  } else {
    print('Generated text is null');
  }
}

}
