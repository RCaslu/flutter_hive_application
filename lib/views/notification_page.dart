import 'package:flutter/material.dart';
import 'package:flutter_hive_application/views/comment_card.dart';
import 'package:flutter_hive_application/views/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: Column(
        children: [
          NotificationCard(
            risk: "Alto risco",
            title: "IP suspeito detectado",
            message:
                "Detectamos um IP suspeito que pode estar envolvido em atividades maliciosas. Para proteger a integridade do sistema, tomamos medidas preventivas imediatas.",
            icon: "assets/icons/icon.png",
            timestamp: "2023-10-01 12:00",
          ),
          CommentCard(
            userName: "User123",
            comment: "This is a comment.",
            size: CardSize.large,
          ),
        ],
      ),
    );
  }
}
