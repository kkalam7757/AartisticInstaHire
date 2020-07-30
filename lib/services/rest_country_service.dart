import 'package:aartistic/constants/route_names.dart';
import 'package:dio/dio.dart';

class RestCountry {
   static Future getCountries() async {
     var dio = Dio();
     Response response = await dio.get('http://battuta.medunes.net/api/quota/?key='+RestCountryAPIKey);
     print(response);
    
  }
  // Future getRegions(country) async {
  //   var api = RestCountries.setup(RestCountryAPIKey);
  //   List<Region> regions = await api.getRegions(countryCode: country);
  //   return  regions;
  // }
  // Future getCities(country,region) async {
  //   var api = RestCountries.setup(RestCountryAPIKey);
  //   List<City> regions = await api.getCities(countryCode: country,region: region);
  //   return  regions;
  // }

}