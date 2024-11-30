import 'package:flutter/material.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';

class SentEmail {
  SentEmail({
    required this.controller,
    required this.subject,
  });
  final TextEditingController controller;
  final subject;
  void sendEmail(BuildContext context) async {
    final mailer = Mailer(
        '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');
    final content = Content('text/plain', controller.text);
    final toAddress = Address('21010646@st.phenikaa-uni.edu.vn');
    final fromAddress = Address('xuantruongit32@gmail.com');
    final personalization = Personalization([toAddress]);

    final email =
        Email([personalization], fromAddress, subject, content: [content]);

    try {
      print('Sending email...');
      await mailer.send(email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sent successfully!'),
        ),
      );
      controller.clear();
    } catch (e) {
      print('Error sending email: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error, please try again'),
        ),
      );
    }
  }
}
