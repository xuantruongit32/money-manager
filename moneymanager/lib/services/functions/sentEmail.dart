import 'package:flutter/material.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';

class SentEmail {
  SentEmail({
    required this.body,
    required this.subject,
  });
  final body;
  final subject;
  void sendEmail(BuildContext context) async {
    final mailer = Mailer(
        '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');
    final content = Content('text/plain', body);
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
