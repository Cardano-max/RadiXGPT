import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
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
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ContactItem(
                title: 'Email',
                description: 'mateeb.ce41ceme@ce.ceme.edu.pk',
                icon: Icons.email,
                color: Colors.purple,
              ),
              SizedBox(height: 20),
              ContactItem(
                title: 'WhatsApp',
                description: '+923090909725',
                icon: Icons.chat,
                color: Colors.purple,
              ),
              SizedBox(height: 20),
              ContactItem(
                title: 'Headquarter',
                description: 'NUST College of Electrical & Mechanical Engineering, Islamabad',
                icon: Icons.location_on,
                color: Colors.purple,
              ),
              SizedBox(height: 20),
              ContactItem(
                title: 'GitHub Profile',
                description: 'https://github.com/Cardano-max',
                icon: Icons.code,
                color: Colors.purple,
                isLink: true,
              ),
              SizedBox(height: 20),
              ContactItem(
                title: 'Kaggle Account',
                description: 'https://www.kaggle.com/ateebtaseer1',
                icon: Icons.analytics,
                color: Colors.purple,
                isLink: true,
              ),
              SizedBox(height: 20),
              ContactItem(
                title: 'LinkedIn Profile',
                description: 'https://www.linkedin.com/in/ateebtaseer/',
                icon: Icons.person,
                color: Colors.purple,
                isLink: true,
              ),
              SizedBox(height: 20),
              Text(
                '© 2023 RadiXGPT. All rights reserved.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 17), // Add extra SizedBox to fix bottom overflow
            ],
          ),
        ),
      ),
    );
  }
}

class ContactItem extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool isLink;

  const ContactItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.isLink = false,
  });

  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isHovered ? widget.color.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isHovered ? widget.color.withOpacity(0.5) : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.color.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              size: 24,
              color: widget.color,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  widget.isLink
                      ? InkWell(
                    onTap: () {},
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        color: isHovered ? widget.color : Colors.black,
                        decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
                      ),
                    ),
                  )
                      : Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
