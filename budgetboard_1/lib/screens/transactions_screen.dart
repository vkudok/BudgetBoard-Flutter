import 'package:budgetboard_1/models/transaction.model.dart';
import 'package:budgetboard_1/services/transaction.service.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:material_ui/material_ui.dart';
import 'package:http/http.dart' as http;

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<Transaction> transactionData = [];
  final transactionService = TransactionService();

  @override
  void initState() {
    super.initState();

    getTransctions();
    
  }

  Future<void> getTransctions() async {
    final data = await transactionService.getTransactions();

    if(!mounted) return;

    setState(() {
      transactionData.clear();
      transactionData.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Транзакции')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Сводка"),
            Expanded(
              child: DataTable2(
                minWidth: 800,
                columns: [
                  DataColumn(label: Text('Тип')),
                  DataColumn(label: Text('Категория')),
                  DataColumn(label: Text('Сумма')),
                  DataColumn(label: Text('Сумма')),
                  DataColumn(label: Text('Сумма')),
                  DataColumn(label: Text('Сумма')),
                  DataColumn(label: Text('Сумма')),
                ],
                rows: [
                  for (final transaction in transactionData)
                    DataRow(
                      cells: [
                        DataCell(Text(transaction.type)),
                        DataCell(Text(transaction.amount.toString())),
                        DataCell(Text(transaction.category ?? '-')),
                        DataCell(Text(transaction.date.toString())),
                        DataCell(Text(transaction.category ?? '-')),
                        DataCell(Text(transaction.comment ?? '-')),
                        DataCell(Text(transaction.type)),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
