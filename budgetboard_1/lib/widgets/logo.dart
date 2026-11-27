import 'package:material_ui/material_ui.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.directional(start: 12, end: 12, top: 12),
      child: Row(
        children: [
          Icon(Icons.signal_cellular_alt, color: Color(0xFFCCFF4D), size: 20),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 6),
            child: Text(
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              'BudgetBoard',
            ),
          ),
        ],
      ),
    );
  }
}
