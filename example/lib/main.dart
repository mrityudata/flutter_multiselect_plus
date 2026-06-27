import 'package:flutter/material.dart';
import 'package:flutter_multiselect_plus/flutter_multiselect_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MultiSelect Plus Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      home: const MultiSelectDemo(),
    );
  }
}

class MultiSelectDemo extends StatefulWidget {
  const MultiSelectDemo({super.key});

  @override
  State<MultiSelectDemo> createState() => _MultiSelectDemoState();
}

class _MultiSelectDemoState extends State<MultiSelectDemo> {
  final List<MultiSelectOption<int>> _programmingLanguages = [
    MultiSelectOption(value: 1, label: 'Dart', icon: Icons.code),
    MultiSelectOption(value: 2, label: 'Kotlin', icon: Icons.android),
    MultiSelectOption(value: 3, label: 'Swift', icon: Icons.apple),
    MultiSelectOption(value: 4, label: 'JavaScript', icon: Icons.data_object),
    MultiSelectOption(value: 5, label: 'Python', icon: Icons.terminal),
    MultiSelectOption(value: 6, label: 'C++', icon: Icons.settings),
  ];

  final List<MultiSelectOption<String>> _days = [
    MultiSelectOption(value: 'Mon', label: 'Monday'),
    MultiSelectOption(value: 'Tue', label: 'Tuesday'),
    MultiSelectOption(value: 'Wed', label: 'Wednesday'),
    MultiSelectOption(value: 'Thu', label: 'Thursday'),
    MultiSelectOption(value: 'Fri', label: 'Friday'),
    MultiSelectOption(value: 'Sat', label: 'Saturday'),
    MultiSelectOption(value: 'Sun', label: 'Sunday'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiSelect Plus'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Basic Multi Select'),
            MultiSelectDropdown<int>(
              items: _programmingLanguages,
              labelText: 'Select Technologies',
              hintText: 'Choose languages you know',
              onSelectionChanged: (selected) {
                debugPrint('Selected IDs: $selected');
              },
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('Single Select Mode'),
            MultiSelectDropdown<String>(
              items: _days,
              isSingleSelect: true,
              labelText: 'Select Preferred Day',
              hintText: 'Pick one day',
              selectedItemColor: Colors.orange,
              onSelectionChanged: (selected) {
                debugPrint('Selected Day: $selected');
              },
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('Custom Styling & Search'),
            MultiSelectDropdown<int>(
              items: _programmingLanguages,
              labelText: 'Advanced Customization',
              title: 'Filter Skills',
              showSearch: true,
              maxSelection: 3,
              dropdownHeight: 300,
              chipColor: Colors.indigo.shade100,
              selectedItemColor: Colors.indigo,
              chipTextStyle: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
              inputFieldDecoration: BoxDecoration(
                color: Colors.indigo.withAlpha(15),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.indigo.withAlpha(50), width: 2),
              ),
              onSelectionChanged: (selected) {
                debugPrint('Custom selection: $selected');
              },
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('Compact & Subtle'),
            MultiSelectDropdown<String>(
              items: _days,
              labelText: 'Schedule',
              hintText: 'Select days',
              spaceBtLabelAndField: 10,
              inputFieldDecoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade400, width: 1.5)),
              ),
              dropDownIcon: const Icon(Icons.calendar_month, color: Colors.grey),
              onSelectionChanged: (selected) {},
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade900,
        ),
      ),
    );
  }
}
