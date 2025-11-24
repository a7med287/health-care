import 'package:flutter/material.dart';
import 'package:health_care/core/utils/styles.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("hi",style: Styles.textStyleBold24)),
    );
  }
}