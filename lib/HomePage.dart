import 'package:flutter/material.dart';
import 'package:lastwinner/background.dart';

class ParticipationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 193, 193),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Participation', style: TextStyle(color: Colors.white)),
      ),
      body: CustomBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.brown[200],
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Text('This week participation',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    SizedBox(height: 20.0),
                    Container(
                      height: 400.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          value: 0.85,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                          backgroundColor: Colors.grey[400],
                          strokeWidth: 10.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    _buildLegendItem(
                        iconColor: Colors.pinkAccent, label: 'Sofa'),
                    _buildLegendItem(
                        iconColor: Colors.green, label: 'Dining Table'),
                    _buildLegendItem(
                        iconColor: Colors.yellowAccent,
                        label: 'Kitchen Cabinet'),
                    _buildLegendItem(iconColor: Colors.grey, label: 'Tv Stand'),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {},
                child:
                    Text('Statistics', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem({required Color iconColor, required String label}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
              border: Border.all(color: iconColor),
              color: iconColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10.0),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
