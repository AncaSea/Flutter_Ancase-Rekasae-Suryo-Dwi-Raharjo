import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storages/blocStrorage/bloc/storage_bloc.dart';
import 'package:storages/blocStrorage/register_bloc.dart';
import 'package:storages/main.dart';
import 'package:storages/providerStorage/Models/register.dart';

class RegisterBlocHome extends StatefulWidget {
  const RegisterBlocHome({super.key, required this.dataRegister});

  final Register dataRegister;

  @override
  State<RegisterBlocHome> createState() => _RegisterBlocHomeState();
}

class _RegisterBlocHomeState extends State<RegisterBlocHome> {
  void onRemove() {
    BlocProvider.of<StorageBloc>(context, listen: false)
        .add(RemoveRegister(widget.dataRegister));
    BlocProvider.of<StorageBloc>(context, listen: false)
        .add(RemoveShared());
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const MyApp(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Bloc'),
      ),
      body: Center(
        child: BlocBuilder<StorageBloc, StorageState>(
          builder: (context, state) {
            if (state is StorageInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is StorageLoaded) {
              return Column(
                children: [
                  state.registers.isNotEmpty
                      ? Text('Hello, ${state.registers[0].nama}')
                      : ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterBloc()));
                          },
                          child: const Text('Register')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()));
                      },
                      child: const Text('home')),
                  ElevatedButton(
                      onPressed: () {
                        onRemove();
                      },
                      child: const Text('Log Out'))
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
