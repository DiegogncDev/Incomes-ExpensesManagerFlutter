import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/controller/transaction_provider.dart';
import 'package:money_tracker/model/transaction.dart';
import 'package:provider/provider.dart';

class AddTransactionsDialog extends StatefulWidget {
  const AddTransactionsDialog({super.key});

  @override
  State<AddTransactionsDialog> createState() => _AddTransactionsDialogState();

}

class _AddTransactionsDialogState extends State<AddTransactionsDialog> {
  int? typeIndex = 0;
  TransactionType type = TransactionType.income;
  double amount = 0;
  String description = "";



  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return SizedBox (
      height: 600,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 48,
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3)
            ),

          ),

          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Nueva transaccion", 
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
               color: Colors.teal)
               ),
          ),

          CupertinoSlidingSegmentedControl(
            groupValue: typeIndex,
            children: const {
                0: Text("income"),
                1: Text("Expense")
              }, 
            onValueChanged: (value) {
              
              setState(() {
                typeIndex = value;
                type = value == 0 
                ? TransactionType.income 
                : TransactionType.expense;
              
              });
          }),
          const SizedBox(height: 20),

          Text("Amount", style: textTheme.bodySmall!.copyWith(
            color: Colors.teal
           )),
          TextField(
            inputFormatters: [CurrencyTextInputFormatter.currency(symbol: "\$")],
            textAlign: TextAlign.center,
            decoration: InputDecoration.collapsed(hintText: "\$ 0.00"),
            keyboardType: TextInputType.numberWithOptions(),
            autofocus: true,
            onChanged: (value){

              final valueWithoutDollarSign = value.replaceAll("\$", ""); // reemplazamos el dolar por nada
              final valueWithoutCommas = valueWithoutDollarSign.replaceAll(",", "");
              if (valueWithoutCommas.isNotEmpty) {
                amount = double.parse(valueWithoutCommas); // Convertimos el string a double con parse
              }
            },
            
            ),
          
          const SizedBox(height: 20),
          
          Text("Description", style: textTheme.bodySmall!.copyWith(
            color: Colors.teal
           )),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration.collapsed(hintText: "Enter description", hintStyle: TextStyle(color: Colors.grey)),
            keyboardType: TextInputType.text,
            onChanged: (value){
              description = value;
            },
          ),


          const SizedBox(height: 20),


          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: (){

                // Definimos y Cargamos la transaccion
                final transaction = Transaction(
                  type: type,
                  description: description,
                  amount: type == TransactionType.expense ? -amount : amount
                );

                // con listen: false, no escuchamos. Agregamos la transaccion y se la mandamos al provider
                Provider.of<TransactionProvider>(context, listen: false).addTransaction(transaction);

                Navigator.pop(context);
              }, 
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: Text("Add", style: TextStyle(color: Colors.white),)))
            

        ],
      ),

    );
  }
}