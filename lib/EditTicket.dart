import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lastwinner/AddFurniturePage.dart';
import 'package:lastwinner/background.dart';
import 'package:intl/intl.dart';

class AddTicketPage extends StatefulWidget {
  const AddTicketPage({Key? key}) : super(key: key);

  @override
  State<AddTicketPage> createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
  final _formKey = GlobalKey<FormState>();
  final _ticketIdController = TextEditingController();
  final _ticketNameController = TextEditingController();
  final _ticketPriceController = TextEditingController();
  final _ticketLimitController = TextEditingController();
  final _dateOfDrawController = TextEditingController();
  final _deadlineController = TextEditingController();

  @override
  void dispose() {
    _ticketIdController.dispose();
    _ticketNameController.dispose();
    _ticketPriceController.dispose();
    _ticketLimitController.dispose();
    _dateOfDrawController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (selectedDate != null) {
      final String formattedDate =
          DateFormat('yyyy-MM-dd').format(selectedDate);
      controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Add Ticket'),
      ),
      backgroundColor: Colors.brown[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _ticketIdController,
                  decoration: const InputDecoration(
                    labelText: 'Ticket ID',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a ticket name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ticketNameController,
                  decoration: const InputDecoration(
                    labelText: 'Edit Ticket Name',
                  ),
                  validator: (value) {
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _ticketPriceController,
                  decoration: const InputDecoration(
                    labelText: ' EditTicket Price',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _ticketLimitController,
                  decoration: const InputDecoration(
                    labelText: 'Edit Ticket Limit',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _dateOfDrawController,
                  decoration: const InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    labelText: 'Edit Date of Draw',
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate(_dateOfDrawController);
                  },
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _deadlineController,
                  decoration: const InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    labelText: 'Deadline',
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate(_deadlineController);
                  },
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the form
                      // Do something with the form data
                      // Navigate to the next screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddFurniturePage(),
                        ),
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
