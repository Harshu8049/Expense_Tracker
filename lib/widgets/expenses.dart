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
    setState(() {
      _registerdeExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          const Text('ghj'),
          Expanded(
              child: Expenseslist(
            expenses: _registerdeExpenses,
            onRemoveExpense: _removeExpense,
          ))
        ],
      ),
    );
  }
}
