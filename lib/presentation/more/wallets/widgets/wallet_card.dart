import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final Map<String, dynamic> wallet;

  const WalletCard({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return const Card(child: Center(child: Text('Wallet Card')));
  }
}
