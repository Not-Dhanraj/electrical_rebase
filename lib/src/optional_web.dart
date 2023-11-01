import 'package:electrical_project/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HabibiPage extends StatefulWidget {
  const HabibiPage({super.key});

  @override
  State<HabibiPage> createState() => _HabibiPageState();
}

class _HabibiPageState extends State<HabibiPage> {
  TextEditingController habibiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Habibi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                obscureText: true,
                controller: habibiController,
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0)),
                  contentPadding: const EdgeInsets.all(14),
                  hintText: "Enter the Password Habibi",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (habibiController.text.toLowerCase() == "wallah habibi") {
                  context.replaceNamed(AppRoute.selector.name);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Enter the correct password habibi"),
                    ),
                  );
                }
              },
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}
