import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counterController.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Get.to(Home2());
            },
            icon: Icon(Icons.add_shopping_cart))
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(
                builder: (CounterController controller) {
              return Text("Counter is: ${controller.counter}");
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _counterController.increment, child: Icon(Icons.add)),
    );
  }
}

class Home2 extends StatelessWidget {
  Home2({Key? key}) : super(key: key);

  CounterController _counterController = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<CounterController>(
            builder: (CounterController controller) {
          return Text("Counter is: ${controller.counter}");
        }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _counterController.decrement, child: Icon(Icons.minimize)),
    );
  }
}
