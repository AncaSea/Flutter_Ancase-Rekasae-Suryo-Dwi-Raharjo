import 'package:bloc_appcontacts/bloc/auth/auth_bloc.dart';
import 'package:bloc_appcontacts/bloc/login/bloc_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../new_contact.dart';
import 'contact_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formLoginKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // void loginError() {
  //   const AlertDialog(
  //     title: Text('data'),
  //     actions: [

  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // context.read<BlocLoginBloc>().add(LoginSubmitted(username: '', password: ''));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<BlocLoginBloc, BlocLoginState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login failed')),
            );
          } else if (state is AuthLoaded) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactScreen(title: 'Contacts')));
          }
        },
        builder: (context, state) {
          return Form(
            key: formLoginKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text('Nama         :'),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            // hintText: "contoh: Ancase",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text('Password  :'),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          // keyboardType: TextInputType.number,
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          decoration: InputDecoration(
                            // hintText: "contoh: 0847513841653",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nomor tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // final items = Contact(name: nameController.text, phone: phoneController.text);
                      if (formLoginKey.currentState!.validate()) {                    
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewContact()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.grey,
        ),
      ),
    );
  }
}
