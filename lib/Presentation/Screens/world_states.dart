import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..reset();
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            PieChart(
              dataMap: const {'total': 20, 'Recovered': 15, 'Deaths': 5},
              legendOptions:
                  const LegendOptions(legendPosition: LegendPosition.left, legendTextStyle: TextStyle(color: Colors.white)),
                  
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              animationDuration: const Duration(milliseconds: 1200),
              chartType: ChartType.ring,
              colorList: colorList,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .06),
              child: const Card(
                child: Column(
                  children: [
                    ReusableRow(title: 'Total', value: '200'),
                    ReusableRow(title: 'Total', value: '200'),
                    ReusableRow(title: 'Total', value: '200'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
              child: Center(
                child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff1aa260)),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    child: const Text('Track Countires')),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  const ReusableRow({super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text(title), Text(value)],
          ),
          const SizedBox(height: 5),
          const Divider()
        ],
      ),
    );
  }
}
