import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/submit_report.dart';
import 'package:quiz_app/contact.dart';
import 'package:quiz_app/pricing_page.dart';
import 'package:quiz_app/chat.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RadiXGPT',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          button: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/submit_report': (context) => SubmitReport(),
        '/chat': (context) => ChatPage(),
        '/pricing': (context) => PricingPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RadiXGPT',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              Navigator.pushNamed(context, '/chat');
            },
          ),
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: () {
              Navigator.pushNamed(context, '/pricing');
            },
          ),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF330066),
              Color(0xFF993399),
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return Stack(
              children: [
                Positioned(
                  top: -screenHeight * 0.3,
                  left: -screenWidth * 0.1,
                  child: Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -screenHeight * 0.2,
                  right: -screenWidth * 0.2,
                  child: Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1,
                        vertical: screenHeight * 0.05,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'An Evolution of Machine Doctors',
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Towards Radiology',
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Discover the power of AI in radiology with RadiXGPT.',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/submit_report');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              child: Text(
                                'Get Started',
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 5,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '© 2023 RadiXGPT. All rights reserved.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
