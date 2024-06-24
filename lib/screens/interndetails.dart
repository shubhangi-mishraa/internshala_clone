import 'package:flutter/material.dart';
import 'package:intenshala_assessment/model/internship.dart';

class DetailsScreen extends StatelessWidget {
  final Internship internship;

  DetailsScreen({required this.internship});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Internship details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Actively hiring status
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Actively hiring',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Internship title
                  Text(
                    internship.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Company name
                  Text(
                    internship.companyName,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                          internship.locationNames == []
                              ? Icons.home
                              : Icons.location_on_outlined,
                          size: 16,
                          color: Colors.grey.shade600),
                      SizedBox(width: 4),
                      Text(
                        internship.locationNames == []
                            ? 'Work From Home'
                            : internship.locationNames.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today,
                          size: 16, color: Colors.grey.shade600),
                      SizedBox(width: 4),
                      Text(
                        internship.startDate,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.schedule,
                          size: 16, color: Colors.grey.shade600),
                      SizedBox(width: 4),
                      Text(
                        internship.duration,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Stipend
                  Row(
                    children: [
                      Text(
                        internship.stipend,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Internship type and part-time/full-time
                  Row(
                    children: [
                      Chip(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: const Color.fromARGB(255, 224, 224, 224)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        label: Text(internship.employmentType),
                        backgroundColor: Colors.grey[300],
                        labelStyle: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(width: 4),
                      Chip(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: const Color.fromARGB(255, 224, 224, 224)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        label: Text(internship.type),
                        backgroundColor: Colors.grey[300],
                        labelStyle: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Posting date
                  Text(
                    internship.postedOn ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Who can apply',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Colors.indigo,
                ),
              ),
              Text(
                'Only those candidates can apply who:\n'
                '1. are available for the work from home job/internship\n'
                '2. can start the work from home job/internship between 19th Jun\'24 and 24th Jul\'24\n'
                '3. are available for duration of 1 week\n'
                '4. have relevant skills and interests\n'
                '* Women wanting to start/restart their career can also apply.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Perks',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Colors.indigo,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Chip(
                    label: Text('Certificate'),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: const Color.fromARGB(255, 224, 224, 224)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.grey[300],
                    labelStyle: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text('Letter of recommendation'),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: const Color.fromARGB(255, 224, 224, 224)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.grey[300],
                    labelStyle: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 10),
              Chip(
                label: Text('Flexible work hours'),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: const Color.fromARGB(255, 224, 224, 224)),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.grey[300],
                labelStyle: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 20),
              Text(
                'Number of openings: 100',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
