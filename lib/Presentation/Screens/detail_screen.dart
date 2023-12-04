import 'package:covid_19_app/Presentation/Screens/world_states.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases, totalDeaths, active, critical, todayRecoverd, test;
  DetailScreen({
    super.key, 
    required this.name, 
    required this.image,
    required this.totalCases,
    required this.todayRecoverd,
    required this.active, 
    required this.critical,
    required this.totalDeaths,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: Text(widget.name),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
              child: Card(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .06,),
                    ReusableRow(title: 'Total Cases', value: widget.totalCases.toString()),
                    ReusableRow(title: 'Today Recoverd', value: widget.todayRecoverd.toString()),
                    ReusableRow(title: 'Active', value: widget.active.toString()),
                    ReusableRow(title: 'Critical', value: widget.critical.toString()),
                    ReusableRow(title: 'Total Deaths', value: widget.totalDeaths.toString()),
                    ReusableRow(title: 'Test', value: widget.test.toString()),
                  ],
                ),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.image),
            )
          ],
        )],
      ),
    );
  }
}