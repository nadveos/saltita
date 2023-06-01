import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pocketbase/pocketbase.dart';

import '../models/banda_model.dart';
final pb = PocketBase('https://saltita.meapp.online');


class ServicesApi{
  late List<Item> item = [];
  
  void startData() async {
    final apiconn = await fetchData();
    item = apiconn.items;
   
  }
  
  

  Future<ResultBandas> fetchData() async {
    var url = Uri.parse('https://saltita.meapp.online/api/collections/artistas/records');
    var response = await http.get(url);
    ResultBandas bandas = ResultBandas.fromMap(json.decode(response.body));
    return bandas;

  }
  
  
  

}
