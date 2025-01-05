import 'package:blockchain_project/utils/colors.dart';
import 'package:flutter/material.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  @override
  final TextEditingController addressController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  //final TextEditingController reasonController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenAccent,
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const Text(
              'Depostit Details',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(hintText: 'Enter The address'),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(hintText: 'Enter The amount'),
            ),
            // TextField(
            //   controller: reasonController,
            //   decoration: const InputDecoration(hintText: 'Enter The reason'),
            // ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DepositPage(),
                ),
              ),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green,
                ),
                child: const Center(
                  child: Text(
                    '+ DEPOSIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
