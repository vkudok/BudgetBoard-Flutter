import 'package:budgetboard_1/models/transaction.model.dart';
import 'package:budgetboard_1/widgets/gridRow_widget.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({super.key, required this.transactionData});

  final List<Transaction> transactionData;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: transactionData.length,
        itemBuilder: (context, index) {
          final transaction = transactionData[index];
          return GridrowWidget(transaction: transaction);
        },
      ),
    );
  }
}
