import 'package:flutter/material.dart';
import 'package:chat_sudaman_app/karlo/karlo_service.dart';

// KarloService 인스턴스 생성 및 의존성 주입
final karloService = KarloService();

class KarloPage extends StatefulWidget {
  const KarloPage({Key? key}) : super(key: key);

  @override
  State<KarloPage> createState() => _KarloPageState();
}

class _KarloPageState extends State<KarloPage> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];
  String? _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length + (_imageUrl != null ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == 0 && _imageUrl != null) {
                  return Image.network(_imageUrl!);
                }
                final messageIndex = _imageUrl != null ? index - 1 : index;
                return ListTile(
                  title: Text(
                    _messages[messageIndex],
                    textAlign: TextAlign.start,
                  ),
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
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
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
      _imageUrl = null;
    });

    // KarloService의 search 메서드 호출
    final response = await karloService.search(message);

    // 응답이 있는지 및 images가 null이 아닌지 확인하고 처리
    if (response.containsKey('images') && response['images']!.isNotEmpty) {
      final imageUrl = response['images']![0]['image'];
      setState(() {
        _imageUrl = imageUrl;
      });
    } else {
      print('image not found');
    }
  }
}
