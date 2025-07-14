import 'package:flutter/material.dart';

/// A custom list tile styled like the closed state of TrueExpandableTile,
/// but without the expand/collapse icon. Accepts a child widget.
class CustomStyledListTile extends StatelessWidget {
  final String title;
  final String subtext;

  const CustomStyledListTile({
    super.key,
    required this.title,
    required this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: Colors.white38),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(9, 0, 0, 0),
            blurRadius: 1,
            spreadRadius: 0.5,
            offset: Offset(0, -0),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // No icon here
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtext,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
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
