import 'package:flutter/material.dart';

class PricingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pricing'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Pricing Plans',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  PricingCard(
                    header: 'Basic',
                    price: '\$9.99',
                    features: ['100 reports per month', '24/7 support', 'Basic features'],
                  ),
                  SizedBox(height: 20),
                  PricingCard(
                    header: 'Pro',
                    price: '\$29.99',
                    features: ['Unlimited reports', '24/7 support', 'Advanced features'],
                  ),
                  SizedBox(height: 20),
                  PricingCard(
                    header: 'Enterprise',
                    price: '\$99.99',
                    features: ['Unlimited reports', '24/7 support', 'Custom features'],
                  ),
                ],
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
    );
  }
}

class PricingCard extends StatefulWidget {
  final String header;
  final String price;
  final List<String> features;

  const PricingCard({
    required this.header,
    required this.price,
    required this.features,
  });

  @override
  _PricingCardState createState() => _PricingCardState();
}

class _PricingCardState extends State<PricingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.purple.withOpacity(0.2),
    ).animate(
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
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: _colorAnimation.value,
            child: InkWell(
              onTap: () {
                // Handle plan selection
              },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.header,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.price,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: widget.features.map((feature) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            feature,
                            style: TextStyle(fontSize: 14),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle plan selection
                      },
                      child: Text('Select Plan'),
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
            ),
          ),
        );
      },
    );
  }
}
