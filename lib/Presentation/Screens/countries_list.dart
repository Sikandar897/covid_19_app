import 'package:covid_19_app/Data/Model/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  StateServices stateServices = StateServices();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (vale) {
                setState(() {});
              },
              controller: searchController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  )),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: stateServices.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                                period: const Duration(seconds: 5),
                                baseColor: Colors.red.shade100,
                                highlightColor: Colors.yellow.shade700,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .08,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .08,
                                          color: Colors.white),
                                      title: Container(
                                          height: 10,
                                          width: 89,
                                          color: Colors.white),
                                      subtitle: Container(
                                          height: 10,
                                          width: 89,
                                          color: Colors.white),
                                    )
                                  ],
                                ));
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            /*here we are now filitring data when we want to serach*/
                            String name = snapshot.data![index]['country'];

                            /*if search is empty this list will execute*/
                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  ListTile(
                                      leading: Image(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .08,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .08,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()))
                                ],
                              );
                            }

                            /*if user search something this list will execute or return*/

                            else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  ListTile(
                                      leading: Image(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .08,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .08,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()))
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }))
        ],
      )),
    );
  }
}
