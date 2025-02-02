import 'package:flutter/material.dart';

class BottomNavigationsheet extends StatelessWidget {
  const BottomNavigationsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Home",
              style: TextStyle(fontSize: 40), // Reduced font size
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      height: 200,
                      child: const Center(
                        child: Text(
                          "This is a Bottom Sheet",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text("Show"),
            )
          ],
        ),
      ),
    );
  }
}