import 'dart:convert';

import 'package:covid_19_app/Data/Model/Services/Utilities/app_url.dart';
import 'package:covid_19_app/Data/Model/Services/world_states_model.dart';
import 'package:http/http.dart' as http;

class StateServices {

  Future <WorldStatesModel> fetchWorldStatesRecords () async{

    final response = await http.get(Uri.parse(AppUrl.worldStateApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    }
    else {
      throw Exception('error');
    }
  }
}