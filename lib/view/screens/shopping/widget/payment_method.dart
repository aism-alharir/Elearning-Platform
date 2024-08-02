import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  Methods _paymentMethod = Methods.netbanking;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<Methods>(
          value: Methods.netbanking,
          groupValue: _paymentMethod,
          onChanged: (Methods? value) {
            setState(() {
              _paymentMethod = value!;
            });
          },
          title: const Text("netbanking"),
        ),
        RadioListTile<Methods>(
          value: Methods.cards,
          groupValue: _paymentMethod,
          onChanged: (Methods? value) {
            setState(() {
              _paymentMethod = value!;
            });
          },
          title: const Text("cardit/Debit Card"),
        ),
      ],
    );
  }
}

enum Methods { netbanking, cards }
