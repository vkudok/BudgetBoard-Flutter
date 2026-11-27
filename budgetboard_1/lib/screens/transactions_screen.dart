import 'package:budgetboard_1/models/transaction.model.dart';
import 'package:budgetboard_1/services/transaction.service.dart';
import 'package:budgetboard_1/widgets/button.dart';
import 'package:budgetboard_1/widgets/grid.dart';
import 'package:budgetboard_1/widgets/header.dart';
import 'package:budgetboard_1/widgets/logo.dart';
import 'package:material_ui/material_ui.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<Transaction> transactionData = [];
  String selectedFilter = 'Все';
  static const filterTypes = <String, TransactionType?>{
    'Все': null,
    'Доходы': TransactionType.income,
    'Расходы': TransactionType.expense,
  };
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

  List<Transaction> getFilteredTransactions(
    List<Transaction> transactions,
    String selectedFilter,
  ) {
    final selectedType = filterTypes[selectedFilter];
    if (selectedType == null) return transactions;
    return transactions.where((transaction) => transaction.type == selectedType).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF10232D)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Color(0xFF10232D)),
              child: Column(
                children: [
                  Logo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Header(title: 'Операции'),
                      Button(icon: Icons.add),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              filled: true,
                              fillColor: const Color(0xFF263943),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              hintText: 'Поиск по операциям',
                              hintStyle: const TextStyle(
                                color: Color(0xFFBFC8CC),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                    child: Row(
                      children: [
                        for (final filter in filterTypes.keys)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: ChoiceChip(
                              label: Center(child: Text(filter)),
                              selected: selectedFilter == filter,
                              onSelected: (_) {
                                setState(() {
                                  selectedFilter = filter;
                                });
                              },
                              showCheckmark: false,
                              selectedColor: const Color(0xFFCCFF4D),
                              backgroundColor: const Color(0xFF263943),
                              labelStyle: TextStyle(
                                color: selectedFilter == filter
                                    ? const Color(0xFF10232D)
                                    : Colors.white,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              side: BorderSide.none,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF7F7F4),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: GridWidget(transactionData: getFilteredTransactions(transactionData, selectedFilter)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
