import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDateHeader extends StatelessWidget {
  const TransactionDateHeader({super.key, required this.day});

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final todayDay = DateTime(today.year, today.month, today.day);
    final yesterday = DateTime(today.year, today.month, today.day - 1);
    final dateText = DateFormat(
      day.year == today.year ? 'd MMMM' : 'd MMMM y',
      'ru',
    ).format(day);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFE5E7E5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            if (day == todayDay) const Text('Сегодня, '),
            if (day == yesterday) const Text('Вчера, '),
            Text(dateText),
          ],
        ),
      ),
    );
  }
}
