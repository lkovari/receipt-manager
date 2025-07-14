import 'package:flutter/material.dart';

class TrueExpandableTile extends StatefulWidget {
  final String title;
  final String subtext;
  final Widget child;

  const TrueExpandableTile({
    required this.title,
    required this.subtext,
    required this.child,
    super.key,
  });

  @override
  State<TrueExpandableTile> createState() => _TrueExpandableTileState();
}

class _TrueExpandableTileState extends State<TrueExpandableTile> {
  bool _expanded = false;

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
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white, // Header color 🎨
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title, // Title from prop,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.subtext, // Subtext from prop
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Children (only shown when expanded)
          if (_expanded) widget.child,
        ],
      ),
    );
  }
}
