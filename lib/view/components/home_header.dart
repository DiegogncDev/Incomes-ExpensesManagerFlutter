import 'package:flutter/material.dart';
import 'package:money_tracker/controller/transaction_provider.dart';
import 'package:money_tracker/model/transaction.dart';
import 'package:money_tracker/view/components/header_card.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<TransactionProvider>(context);
    final balance = provider.getBalance();
    final incomes = provider.getTotalIncomes();
    final expenses = provider.getTotalExpenses();

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [

          const SizedBox(height: 10),
          Text("MONEY TRACKER", style: textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade900)),

            const SizedBox(height: 12),

            Text("balance:", style: textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.5))),

            Text("\$ ${balance.toStringAsFixed(2)}", style: textTheme.headlineLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white)),

            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  HeaderCard(
                    title: "Incomes",
                    amount: incomes,
                    icon: Icon(Icons.attach_money, color: Colors.teal),
                  ),
                  SizedBox(width: 12),
                  HeaderCard(
                    title: "expenses",
                    amount: expenses,
                    icon: Icon(Icons.money_off, color: Colors.red),
                  )
                ],
              ),
            )
        ],
      ),
      );
  }
}

