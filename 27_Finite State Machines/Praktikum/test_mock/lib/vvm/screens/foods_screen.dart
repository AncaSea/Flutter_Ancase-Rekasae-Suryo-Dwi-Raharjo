import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model.dart';

class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key});

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  @override
  void initState() {
    Provider.of<ViewModel>(context, listen: false).getAllFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resto Kelontong'),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: modelView.foods.length,
          itemBuilder: (context, index) {
            final data = modelView.foods[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Nama Makanan   : ${data.name}'),
            );
          }),
    );
  }
}
