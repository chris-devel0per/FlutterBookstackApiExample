import 'server_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContentPermissions {

  Future<String> read() async{
    String contentType = 'page';
    String contentID = '1';
    String url = '$urlFull/api/content-permissions/$contentType/$contentID';
    var response = await http.get(Uri.parse(url), headers: headers);

    return response.body;
  }

}