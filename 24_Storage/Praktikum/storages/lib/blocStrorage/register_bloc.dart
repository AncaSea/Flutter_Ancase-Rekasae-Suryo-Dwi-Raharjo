import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storages/providerStorage/Models/register.dart';
import 'package:storages/providerStorage/home_provider.dart';
import 'bloc/storage_bloc.dart';
import 'home_bloc.dart';

class RegisterBloc extends StatefulWidget {
  const RegisterBloc({super.key});

  @override
  State<RegisterBloc> createState() => _RegisterBlocState();
}

class _RegisterBlocState extends State<RegisterBloc> {
  final formKey = GlobalKey<FormState>();

  late List<Register> loginData;

  late Register dataReg;

  bool isLogin = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onAdd() {
    dataReg = Register(nameController.text, emailController.text,
        phoneController.text, passwordController.text, isLogin);

    BlocProvider.of<StorageBloc>(context, listen: false).add(
      AddRegister(dataReg),
    );
    BlocProvider.of<StorageBloc>(context, listen: false).add(
      UpdateShared(),
    );
    // print(dataReg.nama);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (contex) => RegisterBlocHome(dataRegister: dataReg),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Register Bloc'),
        ),
        body: BlocBuilder<StorageBloc, StorageState>(
          builder: (context, state) {
            if (state is StorageInitial) {
              // print('initial');
              return const Center(child: CircularProgressIndicator());
            }
            if (state is StorageLoaded) {
                // print('login');
              if (state.registers.isNotEmpty) {
                for (final item in state.registers) {
                  dataReg = item;
                }
                // print(dataReg.isLogin);
                if (dataReg.isLogin == false) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RegisterProviderHome(dataRegister: dataReg),
                        ),
                        (route) => false);
                  });
                }
              } else {
                // print(state.registers.isEmpty);
                return Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text('Nama     :'),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: "contoh: Ancase",
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
                              child: Text('Email :'),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "contoh: email@email.com",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email tidak boleh kosong';
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
                              child: Text('Telepon :'),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  hintText: "contoh: 0847513841653",
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text('Password :'),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password tidak boleh kosong';
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
                            if (formKey.currentState!.validate()) {
                              onAdd();
                              nameController.clear();
                              emailController.clear();
                              phoneController.clear();
                              passwordController.clear();
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ));
              }
            }
          return Container();
          },),
      ),
    );
  }
}
