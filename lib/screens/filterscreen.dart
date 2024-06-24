import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  final Function(String, String, int?) onApplyFilters;

  FiltersScreen({required this.onApplyFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final _profileController = TextEditingController();
  final _cityController = TextEditingController();

  int? _duration;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void clearTextfield() {
    _profileController.clear();
    _cityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _profileController,
                  decoration: InputDecoration(hintText: 'Add profile'),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'City',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _cityController,
                  decoration: InputDecoration(hintText: 'Add city'),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Maximum Duration (in months)',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: DropdownButton<int>(
                hint: Text('Choose Duration'),
                value: _duration,
                onChanged: (int? newValue) {
                  setState(() {
                    _duration = newValue;
                  });
                },
                items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _profileController.clear();
                      _cityController.clear();
                      _duration = null;
                    });
                  },
                  child: Text(
                    'Clear all',
                    style: TextStyle(
                      color: Colors.indigo,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.onApplyFilters(
                      _profileController.text,
                      _cityController.text,
                      _duration,
                    );
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
