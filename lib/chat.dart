import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with RadiXGPT'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE5E5E5),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Personal Radiology Assistant',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Fine-Tuned Chatbot Powered by GPT-4',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  children: [
                    ChatMessage(
                      sender: 'RadiXGPT',
                      message: 'Welcome to RadiXGPT! How can I assist you today?',
                    ),
                    ChatMessage(
                      sender: 'User',
                      message: 'I have a question about my medical report.',
                    ),
                    // Other chat messages...
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type your message here',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Send message logic
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // End chat logic
              },
              child: Text('Thank You'),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String sender;
  final String message;

  const ChatMessage({
    required this.sender,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(message),
          ),
        ],
      ),
    );
  }
}
