import 'package:flutter/material.dart';
import 'package:money_tracker/view/components/add_transactions_dialog.dart';
import 'package:money_tracker/view/components/home_header.dart';
import 'package:money_tracker/view/components/transactions_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: const SafeArea(
        bottom: false,
        child: Column(
          children: [
            const HomeHeader(),
            const TransactionsList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: (
        ){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, builder: (context){
            return AddTransactionsDialog();
          });
        }, 
        child: const Icon(Icons.add, color: Colors.white,)),
    );
  }
}



