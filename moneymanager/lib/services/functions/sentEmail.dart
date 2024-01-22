import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class SentEmail {
  SentEmail({
    required this.body,
    required this.subject,
  });
  final body;
  final subject;
  void sendEmail(BuildContext context) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: ['xuantruongit32@gmail.com'],
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sent successfully!'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error, please try again'),
        ),
      );
    }
  }
}
