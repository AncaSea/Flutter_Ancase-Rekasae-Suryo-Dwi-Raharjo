import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weekly_task1/form/form_contact_us.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.indigo[400],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: const TextStyle(
                    letterSpacing: 0.7,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Need to get in touch with us? Either fill out the form with with your inquiry or find the ',
                      style: TextStyle(color: Colors.black87),
                    ),
                    TextSpan(
                      text: 'department email',
                      style: TextStyle(color: Colors.blue[500], decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const FormContactUs(), 
                          )
                        );
                      },
                    ),
                    const TextSpan(
                        text: " you'd like to contact below.",
                        style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
