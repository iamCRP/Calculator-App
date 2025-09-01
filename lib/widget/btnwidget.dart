import 'package:calculator_app/color.dart';
import 'package:flutter/material.dart';

class Btnwidget extends StatelessWidget {
  final String btntxt;
  final bool isbtn;
  final bool isequal;
  final VoidCallback ontap;

  const Btnwidget({
    super.key,
    required this.btntxt,
    this.isbtn = false,
    this.isequal = false,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final double btnHeight = MediaQuery.of(context).size.width * 0.2;

    Widget button = InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black12),
          borderRadius: BorderRadius.circular(12),
          color: isbtn ? actioncolor : btncolor,
        ),
        height: btnHeight,
        width: isequal ? null : 85, // null width allows Expanded to take effect
        child: Center(
          child: Text(
            btntxt,
            style: TextStyle(
              color: isbtn ? Colors.white : Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    return isequal ? Expanded(child: button) : button;
  }
}
