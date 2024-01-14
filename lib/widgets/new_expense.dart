import 'package:expense_tracker/Model/expense.dart';

import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onaddExpense});
  final void Function(Expense expense) onaddExpense;
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  // not hold value intinalie so used ? .
  Category _selectedCategory = Category.cloth;
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 2, now.day);
    final pickedDate = await showDatePicker(
        //await and async keyword used so that flutter can wait for the value or date that pcked when it can selected
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      // thus function work when the date is avilable or when we select the date
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    // tryParse('Hello') => null. tryParse(1.12) => 1.2
    final enteredTitle = _titleController.text.trim();
    final amountIsInvlaid = enteredAmount == null ||
        enteredAmount <=
            0; //make amountisinvalid to true or false mean in next stament it contain true or false value if one of them is false then it false and one of them is true then is true
    if (_titleController.text.trim().isEmpty ||
        amountIsInvlaid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make sure a valid title, amount,date and category was entered'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Okay'),
                  )
                ],
              ));
      return; // mean if dialog box i appear then no any code after that is executed
      //show error message
    }
    widget.onaddExpense(Expense(
        title: enteredTitle,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  } //Without trim, a user could enter spaces or tabs, and the field would not be considered empty even though it may not contain any visible characters.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 20,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (_selectedDate == null)
                      const Text('No date selected')
                    else
                      Text(formatter.format(
                          _selectedDate!)), //! this use here because dart we forcely say to assume that this is not null
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('cancel'),
              ),
              ElevatedButton(
                  onPressed: _submitExpenseData, child: const Text("save")),
            ],
          ),
        ],
      ),
    );
  }
}
