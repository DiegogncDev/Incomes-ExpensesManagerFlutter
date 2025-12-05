import 'package:flutter/material.dart';
import 'package:money_tracker/model/transaction.dart';


// Provider es como un viewModel 
class TransactionProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(amount: 1300, description: "salary", type: TransactionType.income),
    Transaction(amount: -1400, description: "entertainment", type: TransactionType.expense),
    Transaction(amount: -500, description: "gamble", type: TransactionType.expense)
  ];

  // con get accedemos a las transacciones desde afuera
  List<Transaction> get transactions => _transactions;


  double getTotalIncomes(){
    return _transactions
    .where((transaction) => transaction.type == TransactionType.income) // Donde la transaccion.type sea igual a income
    .map((transaction) => transaction.amount) // de esa transaccion mapeala y devuelveme solo el amount
    .fold(0, (previusValue, nextValue) => previusValue + nextValue); // del amounr toma el primer valor, luego defino el valor previo y el siguiente y los sumo entre si.
  }

  double getTotalExpenses(){
    return _transactions
    .where((transaction) => transaction.type == TransactionType.expense) // Donde la transaccion.type sea igual a income
    .map((transaction) => transaction.amount) // de esa transaccion mapeala y devuelveme solo el amount
    .fold(0, (previusValue, nextValue) => previusValue + nextValue); // del amounr toma el primer valor, luego defino el valor previo y el siguiente y los sumo entre si.
  }

  double getBalance(){
    return getTotalIncomes() + getTotalExpenses();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }


}