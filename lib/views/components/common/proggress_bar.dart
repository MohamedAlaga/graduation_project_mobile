import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class progres_bar extends StatelessWidget {
  const progres_bar({
    super.key,
    required this.percentage,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          width: 600, // Adjusted width to accommodate for the border and shadow
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 4),
              ),
            ],
            color: Color.fromARGB(255, 0, 220, 234), // Background color
          ),
          child: Stack(
            children: [
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    width: 328, // Width of the progress bar
                    lineHeight: 40,
                    percent: percentage / 100, // Use the percentage value
                    center: null, // Remove the center widget
                    progressColor: Color.fromARGB(255, 255, 95, 132),
                    backgroundColor: Colors.transparent,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                ),
              ),
              Positioned(
                left: 16, // Adjust the left position as needed
                top: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "$percentage%", // Display the percentage value
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Omnes-Arabic',
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 16, // Adjust the right position as needed
                top: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "تقدمك",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Omnes-Arabic',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
