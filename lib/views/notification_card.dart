import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  final String risk;
  final String title;
  final String message;
  final String icon;
  final String timestamp;

  const NotificationCard({
    super.key,
    required this.risk,
    required this.title,
    required this.message,
    required this.icon,
    required this.timestamp,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool isExpanded = false;

  Color getRiskColor() {
    switch (widget.risk.toLowerCase()) {
      case "alto risco":
        return Colors.red;
      case "médio risco":
        return Colors.orange;
      case "baixo risco":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
          ),
        ],
        // aqui entra a borda colorida da lateral
        border: Border(left: BorderSide(color: getRiskColor(), width: 6)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho
            Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      widget.icon,
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.timestamp.isNotEmpty
                          ? widget.timestamp
                          : 'Agora mesmo',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Conteúdo (preview ou completo)
            AnimatedCrossFade(
              firstChild: Text(
                widget.message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              secondChild: Text(
                widget.message,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),

            const SizedBox(height: 12),

            // Rodapé com risco
            Row(
              children: [
                Icon(Icons.circle, color: getRiskColor(), size: 12),
                const SizedBox(width: 6),
                Text(
                  widget.risk,
                  style: TextStyle(
                    color: getRiskColor(),
                    fontWeight: FontWeight.bold,
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
