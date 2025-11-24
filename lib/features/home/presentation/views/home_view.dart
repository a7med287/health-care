import 'package:flutter/material.dart';
import 'package:health_care/core/utils/styles.dart';
import 'package:health_care/features/chat_bot/chat_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routName = "HomeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buttonchat(),

      body: Center(
        child: Text("Welcome To Home", style: Styles.textStyleBold24),
      ),
    );
  }
}

class buttonchat extends StatelessWidget {
  const buttonchat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 136, 200, 252),
            const Color.fromARGB(255, 240, 240, 240),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(height: 400, width: 300, child: ChatView()),
            ),
          );
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Icon(Icons.message),
      ),
    );
  }
}
