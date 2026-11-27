import 'package:budgetboard_1/models/transaction.model.dart';
import 'package:budgetboard_1/widgets/icon_widget.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.transaction});
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,##0.##', 'ru');
    final amount = formatter.format(transaction.amount);
    final comment = transaction.comment;

    var category = transaction.category;
    if ((category == '-' || category == null) &&
        transaction.type == TransactionType.income) {
      category = 'Поступление средств';
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWidget(type: transaction.type),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          style: TextStyle(
                            fontWeight: FontWeight(600),
                            fontSize: 14,
                            color: Color(0xFF1C2428),
                          ),
                          category ?? '-',
                        ),
                        if (comment != '' && comment != null)
                          Text(
                            style: TextStyle(
                              fontWeight: FontWeight(400),
                              fontSize: 12,
                              color: Color(0xFF7D8588),
                            ),
                            comment,
                          ),
                      ],
                    ),
                  ),
                ),

                Text(
                  style: TextStyle(
                    fontWeight: FontWeight(600),
                    fontSize: 12,
                    color: transaction.type == TransactionType.expense
                        ? Color(0xFFE05259)
                        : Color(0xFF2E9B49),
                  ),
                  transaction.type == TransactionType.expense
                      ? '-$amount ₽'
                      : '+$amount ₽',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
