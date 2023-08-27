import 'server_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecycleBin {

  Future<String> list() async{
    print('Trying List');
    String url = '$urlFull/api/recycle-bin';
    var response = await http.get(Uri.parse(url), headers: headers);

    return response.body;
  }

  Future<String> restore() async{

    String deletionID= '121';

    String url = '$urlFull/api/recycle-bin/$deletionID';
    var response = await http.get(Uri.parse(url), headers: headers);
    return response.body;
  }


  Future<String> destroy() async{

    String deletionID= '121';

    String url = '$urlFull/api/recycle-bin/$deletionID';
    var response = await http.delete(Uri.parse(url), headers: headers);
    return response.body;
  }
}