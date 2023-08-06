import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneyp/feature/chat-gpt-api/chatgpt_model.dart';
import 'package:http/http.dart' as http;

class ChatGPTController with ChangeNotifier {
  bool _loading = false;
  bool _loading1 = false;
  ChatGPTModel _chatGPTModel = ChatGPTModel();

  set chatGPTModel(v) {
    _chatGPTModel = v;
    notifyListeners();
  }

  set loading(v) {
    _loading = v;
    notifyListeners();
  }

  set loading1(v) {
    _loading1 = v;
    notifyListeners();
  }

  ChatGPTModel get chatGPTModel => _chatGPTModel;
  bool get loading => _loading;
  bool get loading1 => _loading1;

  Future<ChatGPTModel> futurePersonalGuide(
      {String? userTransactionList, bool? check, String? userQuery}) async {
    String url = "https://api.openai.com/v1/chat/completions";
    check == true ? loading = true : loading1 = true;
    Map<String, dynamic> data = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": userTransactionList},
        {"role": "user", "content": userQuery}
      ]
    };
    final response =
        await http.post(Uri.parse(url), body: json.encode(data), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer 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',
    });
    print("response.body");
    print(response.body);
    if (response.statusCode == 200) {
      loading = false;
      loading1 = false;
      Map<String, dynamic> data = jsonDecode(response.body);
      chatGPTModel = ChatGPTModel.fromJson(data);
      return chatGPTModel;
    } else {
      loading = false;
      loading1 = false;
      notifyListeners();
      return ChatGPTModel();
    }
  }
}
