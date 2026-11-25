import 'dart:convert';

import 'package:budgetboard_1/models/transaction.model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<List<Transaction>> getTransactions() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/transactions'),
    );

    final jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList
        .map((item) => Transaction.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
