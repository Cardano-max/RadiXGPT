import 'package:flutter/material.dart';

class SubmitReportPage extends StatefulWidget {
  @override
  _SubmitReportPageState createState() => _SubmitReportPageState();
}

class _SubmitReportPageState extends State<SubmitReportPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Report'),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeInAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white.withOpacity(0.3),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Let's Get Started!",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Enter your information below to begin using RadiXGPT.',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              // Handle form submission
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 15,
                              ),
                              child: Text('Submit'),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '© 2023 RadiXGPT. All rights reserved.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
