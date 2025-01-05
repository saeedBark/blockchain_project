import 'package:blockchain_project/features/dashboard/ui/dashboard_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Appkeise());
}

class Appkeise extends StatelessWidget {
  const Appkeise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}
