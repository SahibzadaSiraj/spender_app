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
          'Bearer eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJlYiI6IjBKL3FNYy9iaWhqb0d0VjY1Z2xnIiwianRpIjoiYWNjdG9rXzAwMDBBWURyOXVEQVNkSVRRdlE3bzkiLCJ0eXAiOiJhdCIsInYiOiI2In0.XhQH5mv5rHqGGaFJVDktscW1RP2Mse3ff1rVcmLcLGAReamXK2Gs0PYVyidbC5X4roor_C571I37-56LkhDDqw',
    });
    print("response.body: ${response.body}");
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      map['transactions'].forEach((v) {
        transactionList.add(TransactionModel.fromJson(v));
      });
      notifyListeners();
      return transactionList;
    } else {
      notifyListeners();
      return [];
    }
  }
}
