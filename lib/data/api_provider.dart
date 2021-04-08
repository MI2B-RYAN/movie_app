import 'dart:convert';

import 'package:http_movies2/model/popular_movies.dart';
import 'package:http/http.dart'  show Client;

class ApiProvider{
  String apiKey = '754ab55a35019a4b676f42780cd55715';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async{
   
  //  String url = '$baseUrl/movie/popular?api_key=$apiKey';
  //  print(url);
   final response = await client.get('$baseUrl/movie/popular?api_key=$apiKey');
  
    if(response.statusCode == 200){
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}