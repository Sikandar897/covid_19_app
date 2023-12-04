import 'package:covid_19_app/Data/Model/Services/states_services.dart';
import 'package:covid_19_app/Presentation/Screens/detail_screen.dart';
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
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Covid 19 Tracking App'),
        
      ),
      backgroundColor: Colors.white,
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
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]['countryInfo']['flag'],
                                        totalCases: snapshot.data![index]['cases'],
                                        totalDeaths: snapshot.data![index]['deaths'],
                                        active: snapshot.data![index]['active'],
                                        test: snapshot.data![index]['tests'],
                                        todayRecoverd: snapshot.data![index]['todayRecovered'],
                                        critical: snapshot.data![index]['critical'],
                                        
                                      )));
                                    },
                                    child: ListTile(
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
                                            .toString())),
                                  )
                                ],
                              );
                            }

                            /*if user search something this list will execute or return*/

                            else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return InkWell(
                                  onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]['countryInfo']['flag'],
                                        totalCases: snapshot.data![index]['cases'],
                                        totalDeaths: snapshot.data![index]['deaths'],
                                        active: snapshot.data![index]['active'],
                                        test: snapshot.data![index]['tests'],
                                        todayRecoverd: snapshot.data![index]['todayRecovered'],
                                        critical: snapshot.data![index]['critical'],
                                        
                                      )));
                                    },
                                child: Column(
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
                                ),
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
