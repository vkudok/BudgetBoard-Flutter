import 'package:budgetboard_1/models/transaction.model.dart';
import 'package:budgetboard_1/widgets/transaction_tile.dart';
import 'package:budgetboard_1/widgets/transaction_date_header.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({super.key, required this.transactionData});

  final List<Transaction> transactionData;

  @override
  Widget build(BuildContext context) {
    final transactionsByDay = <DateTime, List<Transaction>>{};

    for (final transaction in transactionData) {
      final date = transaction.date;
      final day = DateTime(date.year, date.month, date.day);
      final transactionsForDay = transactionsByDay.putIfAbsent(
        day,
        () => <Transaction>[],
      );
      transactionsForDay.add(transaction);
    }

    final days = transactionsByDay.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          final transactions = transactionsByDay[day]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TransactionDateHeader(day: day),
              for (final transaction in transactions)
                TransactionTile(transaction: transaction),
            ],
          );
        },
      ),
    );
  }
}
