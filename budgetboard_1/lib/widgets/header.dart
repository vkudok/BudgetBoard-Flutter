import 'package:material_ui/material_ui.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Text(
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w700,
        ),
        title,
      ),
    );
  }
}
