import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  final String inputtxt;
  final String reslutxt;
  const ContainerPage({
    super.key,
    required this.inputtxt,
    required this.reslutxt,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(11),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black12),
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(255, 134, 223, 140),
        ),
        // Responsive width (80% of screen width)
        width: screenWidth * 1.9,
        // Height adjusts automatically with content
        constraints: const BoxConstraints(minHeight: 120, maxHeight: 180),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    inputtxt,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    reslutxt,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
