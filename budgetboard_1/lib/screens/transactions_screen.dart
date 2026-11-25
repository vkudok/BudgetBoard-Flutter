import 'package:budgetboard_1/models/transaction.model.dart';
import 'package:budgetboard_1/services/transaction.service.dart';
import 'package:budgetboard_1/widgets/grid_widget.dart';
import 'package:material_ui/material_ui.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<Transaction> transactionData = [];
  final transactionService = TransactionService();
  final transactionColumnNames = ['Тип'];

  @override
  void initState() {
    super.initState();

    getTransctions();
  }

  Future<void> getTransctions() async {
    final data = await transactionService.getTransactions();

    if (!mounted) return;

    setState(() {
      transactionData.clear();
      transactionData.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Транзакции')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF7F7F4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: GridWidget(transactionData: [...transactionData, ...transactionData])
            ),
          ),
        ],
      ),
    );
  }
}
