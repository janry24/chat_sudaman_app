import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'chat_gpt_class.dart';

class ChatGPTService extends ChangeNotifier {
  List<ChatGPT> chatGPTList = [];

  void search(String prompt) async {
    if (prompt.isNotEmpty) {
      Response res = await Dio().get(
        // "https://www.googleapis.com/books/v1/volumes?q=$q&startIndex=0&maxResults=40",
        "https://api.kakaobrain.com/v1/inference/kogpt/generation?prompt=$prompt&max_tokens=40",
      );
      List items = res.data["items"];
      print(items);
    }
  }
}