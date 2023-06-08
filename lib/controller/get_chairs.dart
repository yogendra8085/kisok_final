import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/table_chairs.dart';
import '../utils/const/const_string.dart';

class GetTableChairsController{
  TabaleChairsModel tabaleChairsModel=TabaleChairsModel();
   gettable() async {
    
      final prefs = await SharedPreferences.getInstance();
final Uri areaselected = Uri.parse(ConstString.baseurl+ConstString.gettable);
 final headers = {
      'Content-Type': 'application/json',
      "Authorization": "${prefs.getString("userToken")}"
    };
    try{
      final response =
          await http.get(areaselected, headers: headers);
            var data = jsonDecode(response.body.toString());
            print(response.statusCode.toString()+"responsecode");
             print(response.body.toString()+"responsecode");
            if(response.statusCode==200){
  tabaleChairsModel=TabaleChairsModel.fromJson(data);
   print("${tabaleChairsModel.listOfData?.length.toString()}+length");
  return tabaleChairsModel;
            }
          

    } catch(e){
        
    }
    return tabaleChairsModel;
 
  }
}