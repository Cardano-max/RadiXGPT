import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubmitReport extends StatelessWidget {
  final String reportUrl = 'https://singularity666-radixgpt-v2.hf.space';

  Future<void> launchURL() async {
    if (await canLaunch(reportUrl)) {
      await launch(reportUrl);
    } else {
      throw 'Could not launch $reportUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Report'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purple.withOpacity(0.2), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'WebView is not supported on Windows.\n\nClick the button below to open the report in your default browser.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                launchURL();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                child: Text(
                  'Consult us about your Report',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
