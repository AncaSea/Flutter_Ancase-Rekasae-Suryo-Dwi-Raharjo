import 'package:flutter/material.dart';
import 'package:weekly_task2/form/form_email.dart';
import 'package:weekly_task2/form/form_message.dart';
import 'package:weekly_task2/form/form_name.dart';

class FormBody extends StatefulWidget {
  const FormBody({super.key});

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final _formKey = GlobalKey<FormState>();

  bool showFirstName = false;
  bool showLastName = false;
  bool showEmail = false;
  bool showMessage = false;

  TextEditingController firstNameController = TextEditingController();
  String firstName = 'Value not Entered';
  TextEditingController lastNameController = TextEditingController();
  String lastName = 'Value not Entered';
  TextEditingController emailController = TextEditingController();
  String email = 'Value not Entered';
  TextEditingController messageController = TextEditingController();
  String message = 'Value not Entered';

  void setText() {
    setState(() {
      firstName = firstNameController.text;
      lastName = lastNameController.text;
      email = emailController.text;
      message = messageController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 20, 14, 20),
        child: ListView(
          children: [

            FormName(firstName: firstName, firstNameController: firstNameController, showFirstName: showFirstName,
              lastName: lastName, lastNameController: lastNameController, showLastName: showLastName),

            FormEmail(email: email, emailController: emailController, showEmail: showEmail),
            
            const SizedBox(
              height: 20,
            ),

            FormMessage(showMessage: showMessage, message: message, messageController: messageController),
            
            const SizedBox(
              height: 20,
            ),
            
            Container(
              alignment: Alignment.centerLeft,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setText();
                    showDialog<String>(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: const Text('Input Data'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Name : $firstName $lastName'),
                            Text('Email : $email'),
                            Text('Message : $message')
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context, 'OK'), 
                            child: const Text('OK')
                          )
                        ],
                      )
                    );
                    firstNameController.clear();
                    lastNameController.clear();
                    emailController.clear();
                    messageController.clear();
                    setState(() {
                      showFirstName = false;
                      showLastName = false;
                      showEmail = false;
                      showMessage= false;
                    });
                  } 
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}