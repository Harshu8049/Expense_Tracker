import 'package:expense_tracker/Model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registerdeExpenses = [
    Expense(
        title: 'hello',
        amount: 5000,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'hello',
        amount: 557,
        date: DateTime.now(),
        category: Category.grocery),
    Expense(
        title: 'hello',
        amount: 678,
        date: DateTime.now(),
        category: Category.cloth),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onaddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerdeExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerdeExpenses.indexOf(expense);
    setState(() {
      _registerdeExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense deleted.'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerdeExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expense found. Start adding some !',
          style: TextStyle(color: Colors.black)),
    );

    if (_registerdeExpenses.isNotEmpty) {
      mainContent = Expenseslist(
        expenses: _registerdeExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker',
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [const Text('ghj'), Expanded(child: mainContent)],
      ),
    );
  }
}
