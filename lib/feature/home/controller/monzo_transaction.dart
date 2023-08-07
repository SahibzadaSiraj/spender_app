import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneyp/models/transaction_model.dart';
import 'package:http/http.dart' as http;

class MonzoController with ChangeNotifier {
  List<TransactionModel> _transactionList = [];

  set transactionList(v) {
    _transactionList = v;
    notifyListeners();
  }

  List<TransactionModel> get transactionList => _transactionList;
  MonzoController() {
    getAllTransaction();
  }

  Future<List<TransactionModel>> getAllTransaction() async {
    String url =
        "https://api.monzo.com//transactions?expand[]=merchant&account_id=acc_0000APGpc1a4cahRlvDMH5";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJlYiI6IlVDcmx5MmhMRnk2NDVibnNFdUdqIiwianRpIjoiYWNjdG9rXzAwMDBBWVVFVnUyZEJEOFJwWGoxT2IiLCJ0eXAiOiJhdCIsInYiOiI2In0.jprISybQ3kWPeY1ZevHW6R7El7WsVuNXzaVHRABW6oHT6Ybp9GH6_Ig82t76si-jJfC20MqyHKAe2IHfILFLbA',
    });
    print("response.body: ${response.body}");
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      map['transactions'].forEach((v) {
        transactionList.add(TransactionModel.fromJson(v));
      });
      notifyListeners();
      print("response.body: ${transactionList.length}");
      return transactionList;
    } else {
      notifyListeners();
      return [];
    }
  }
}
