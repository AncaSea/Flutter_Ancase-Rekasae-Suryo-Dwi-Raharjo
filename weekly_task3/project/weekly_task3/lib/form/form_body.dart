import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/actions/dialog_add_user.dart';
import 'package:weekly_task2/actions/dialog_update_user.dart';
import 'package:weekly_task2/form/form_email.dart';
import 'package:weekly_task2/form/form_message.dart';
import 'package:weekly_task2/form/form_name.dart';
import 'package:uuid/uuid.dart';
import 'package:weekly_task2/vvm/screens/data_user.dart';


import '../models/user_model.dart';
import '../vvm/view_model.dart';

class FormBody extends StatefulWidget {
  const FormBody({super.key, this.dataUserModel});

  final DataUser? dataUserModel;

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

  @override
  void initState() {
    final update = Provider.of<BusManager>(context, listen: false);
    super.initState();
    if (widget.dataUserModel != null) {
      firstNameController.text = widget.dataUserModel!.firstName;
      lastNameController.text = widget.dataUserModel!.lastName;
      emailController.text = widget.dataUserModel!.email;
      messageController.text = widget.dataUserModel!.message;
      update.isUpdateState();
    } else {
      update.isUpdateState();
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

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
    final busProvider = Provider.of<BusManager>(context, listen: false);
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setText();
                        if (!busProvider.isUpdate) {
                          showDialog<String>(
                          context: context, 
                          builder: (context) => DialogAddUser(
                                firstName: firstName, firstNameController: firstNameController,
                                lastName: lastName, lastNameController: lastNameController,
                                email: email, emailController: emailController,
                                message: message,messageController: messageController)
                          );
                        } else {
                          showDialog(
                          context: context,
                          builder: (context) => DialogUpdateUser(
                                firstNameController: firstNameController, firstName: firstName, 
                                lastNameController: lastNameController, lastName: lastName, 
                                emailController: emailController, email: email, 
                                messageController: messageController, message: message, 
                                dataUserModel: widget.dataUserModel,)
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DataUserPage(),
                      )); 
                    },
                    child: const Text(
                      "Data Users",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}