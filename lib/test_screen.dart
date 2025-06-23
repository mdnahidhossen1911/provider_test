import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/slider_model.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final slidermodel = Provider.of<SliderModel>(context, listen: false);
    print('bulid');
    return Scaffold(
      appBar: AppBar(title: Text('SEC')),
      body: Center(
        child: Column(
          children: [
            Consumer<SliderModel>(
              builder: (context, value, child) =>
              Slider(
                min: 0,
                max: 1.0,
                value: value.value,
                onChanged: (value) {
                  slidermodel.setValue(value);
                },
              ),
            ),
            Consumer<SliderModel>(builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      height: 70,
                      color: Colors.green.withOpacity(value.value),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      height: 70,
                      color: Colors.red.withOpacity(value.value),
                    ),
                  ),
                ],
              );
            },)
          ],
        ),
      ),
    );
  }
}
