import 'package:flutter/material.dart';
import 'package:intenshala_assessment/model/internship.dart';
import 'package:intenshala_assessment/screens/interndetails.dart';

class InternshipCard extends StatefulWidget {
  final Internship internship;

  InternshipCard({required this.internship});

  @override
  _InternshipCardState createState() => _InternshipCardState();
}

class _InternshipCardState extends State<InternshipCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(internship: widget.internship),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
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
              widget.internship.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 4),
            // Company name
            Text(
              widget.internship.companyName,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                    (widget.internship.locationNames == null ||
                            widget.internship.locationNames.isEmpty)
                        ? Icons.home
                        : Icons.location_on_outlined,
                    size: 16,
                    color: Colors.grey.shade600),
                SizedBox(width: 4),
                Text(
                  (widget.internship.locationNames == null ||
                          widget.internship.locationNames.isEmpty)
                      ? 'Work From Home'
                      : widget.internship.locationNames.toString(),
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
                  widget.internship.startDate,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.schedule, size: 16, color: Colors.grey.shade600),
                SizedBox(width: 4),
                Text(
                  widget.internship.duration,
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
                  widget.internship.stipend,
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
                  label: Text(widget.internship.employmentType),
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
                  label: Text(widget.internship.type),
                  backgroundColor: Colors.grey[300],
                  labelStyle: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Posting date
            Text(
              widget.internship.postedOn ?? '',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
