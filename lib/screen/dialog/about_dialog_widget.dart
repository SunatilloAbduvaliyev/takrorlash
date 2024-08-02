import 'package:flutter/material.dart';

class AboutDialogWidget extends StatelessWidget {
  const AboutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AboutDialog(
                    applicationIcon: FlutterLogo(),
                    applicationLegalese: "Legalese",
                    applicationName: "Takrorlash",
                    applicationVersion: "version: 1.0.0",
                    children: [
                      Text(
                          "Bu About Dialog va Application haqirda ma'lumot beradi.")
                    ],
                  );
                });
          },
          child: const Text('About Dialog Widget'),
        ),
      ),
    );
  }
}
