import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intenshala_assessment/model/internship.dart';
import 'package:intenshala_assessment/screens/interndetails.dart';
import 'package:intenshala_assessment/screens/widget/internshipcard.dart';
import 'dart:convert';
import 'filterscreen.dart';

class InternshipsPage extends StatefulWidget {
  @override
  _InternshipsPageState createState() => _InternshipsPageState();
}

class _InternshipsPageState extends State<InternshipsPage> {
  late Future<List<Internship>> internships;
  String _profileFilter = '';
  String _cityFilter = '';

  // List<int> _stipendFilter = [];
  int? _durationFilter;

  @override
  void initState() {
    super.initState();
    internships = fetchInternships();
  }

  Future<List<Internship>> fetchInternships() async {
    final response = await http
        .get(Uri.parse('https://internshala.com/flutter_hiring/search'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<Internship> allInternships =
          Internship.fromJsonList(jsonResponse['internships_meta']);

      return allInternships.where((internship) {
        final duration = _durationFilter ?? 0;
        return (_profileFilter.isEmpty ||
                internship.title
                    .toLowerCase()
                    .contains(_profileFilter.toLowerCase())) &&
            (_cityFilter.isEmpty ||
                internship.locationNames.any((location) => location
                    .toLowerCase()
                    .contains(_cityFilter.toLowerCase()))) &&
            // (_stipendFilter.isEmpty ||
            //     _stipendFilter.any((stipend) =>
            //         internship.stipend.toLowerCase().contains(stipend.toString())))
            //         &&
            (_durationFilter == null ||
                int.parse(internship.duration.substring(0, 1)) <= duration);
      }).toList();
    } else {
      throw Exception('Failed to load internships');
    }
  }

  void _applyFilters(
    String profile,
    String city,
    int? duration,
  ) {
    setState(() {
      _profileFilter = profile;
      _cityFilter = city;
      // _stipendFilter = stipends;
      _durationFilter = duration;
      internships = fetchInternships();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Internships',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list_alt, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FiltersScreen(onApplyFilters: _applyFilters),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildActiveFilters(),
          Expanded(
            child: FutureBuilder<List<Internship>>(
              future: internships,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InternshipCard(internship: snapshot.data![index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveFilters() {
    List<Widget> filterWidgets = [];

    if (_profileFilter.isNotEmpty) {
      filterWidgets.add(_buildFilterChip('Profile: $_profileFilter'));
    }

    if (_cityFilter.isNotEmpty) {
      filterWidgets.add(_buildFilterChip('City: $_cityFilter'));
    }

    // if (_stipendFilter.isNotEmpty) {
    //   filterWidgets
    //       .add(_buildFilterChip('Stipend: ₹${_stipendFilter.join(', ₹')}'));
    // }

    if (_durationFilter != null) {
      filterWidgets.add(_buildFilterChip('Duration: $_durationFilter months'));
    }

    return filterWidgets.isEmpty
        ? SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: filterWidgets,
            ),
          );
  }

  Widget _buildFilterChip(String label) {
    return Chip(
      label: Text(label),
      onDeleted: () {
        setState(() {
          if (label.startsWith('Profile: ')) {
            _profileFilter = '';
          } else if (label.startsWith('City: ')) {
            _cityFilter = '';
          } else if (label.startsWith('Duration: ')) {
            _durationFilter = null;
          }
        });
        internships = fetchInternships();
        setState(() {});
      },
    );
  }
}
