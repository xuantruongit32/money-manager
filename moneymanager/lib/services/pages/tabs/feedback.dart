import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/sentEmail.dart';

class FeedBack extends StatefulWidget {
  FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final _feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your feedback here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => SentEmail(
                      body: _feedbackController.text,
                      subject: 'Feedback from Money Manager')
                  .sendEmail(context),
              child: Text('Send Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
