import 'package:budgetboard_1/models/transaction.model.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.type});

  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: type.name == TransactionType.income ? Color(0xFFE3F3E6) : Color(0xFFFBE8E9),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Icon(
          type.name == TransactionType.income ? Icons.arrow_upward : Icons.arrow_downward,
          color: type.name == TransactionType.income ? Color(0xFF2E9B49) : Color(0xFFE05259),
        ),
      ),
    );
  }
}
