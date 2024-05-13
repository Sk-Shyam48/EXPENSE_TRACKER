import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction {
  final IconData iconData;
  final Color iconBackgroundColor;
  final String payMethod;
  final String paymentFor;
  final double amount;
  final DateTime date;

  Transaction({
    required this.iconData,
    required this.iconBackgroundColor,
    required this.payMethod,
    required this.paymentFor,
    required this.amount,
    required this.date,
  });
}

class TransactionSection extends StatelessWidget {
  final Transaction transaction;

  const TransactionSection({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(transaction.date);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: transaction.iconBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(transaction.iconData),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.payMethod,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transaction.paymentFor,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formattedDate,
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
              Text(
                '\$${transaction.amount.toStringAsFixed(1)}',
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
