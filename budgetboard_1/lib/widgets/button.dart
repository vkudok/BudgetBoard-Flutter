import 'package:material_ui/material_ui.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: 
      IconButton(
        onPressed: () {
          // Позже здесь откроем форму добавления операции
        },
        style: IconButton.styleFrom(
          backgroundColor: const Color(0xFFCCFF4D),
          foregroundColor: const Color(0xFF10232D),
          fixedSize: const Size(44, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        icon: Icon(icon),
      ),
    );
  }
}
