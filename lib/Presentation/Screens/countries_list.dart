import 'package:flutter/material.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
            child: Text(
          '         Hi There! \n\nThis Application is under development \n\n    Happy Coding! ',
          style: TextStyle(color: Colors.white, fontSize: 30),
        )),
      ),
    );
  }
}
