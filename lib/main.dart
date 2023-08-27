import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';

import 'controller/server_info.dart';

import 'controller/methodshandler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(urlFull=='http://example.com'){
      String errorString ='URL IS NOT CHANGED. PLEASE CHANGE THE URL.\nYOU CAN FIND THIS VARIABLE IN /lib/controller/server_info.dart:1\n';

      print(errorString);

      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
          useMaterial3: true,
        ),
        home: error(errorString: errorString),
      );
    }

    if(tokenId=='tokenid'){
      String errorString ='TOKENID IS NOT CHANGED PLEASE CHANGE THE TOKENID.\nYOU CAN FIND THIS VARIABLE IN /lib/controller/server_info.dart:3\n';

      print(errorString);

      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
            useMaterial3: true,
          ),
          home: error(errorString: errorString),
      );
    }

    if(secret=='secret'){
      String errorString ='SECRET IS NOT CHANGED PLEASE CHANGE THE SECRET.\nYOU CAN FIND THIS VARIABLE IN /lib/controller/server_info.dart:4\n';

      print(errorString);

      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
          useMaterial3: true,
        ),
        home: error(errorString: errorString),
      );
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class error extends StatelessWidget {
  const error({Key? key, required this.errorString}) : super(key: key);

  final String errorString;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(errorString),
    );
  }
}



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  MethodsHandler methodsHandlerclass = MethodsHandler();

  List<String> attachmentsMethods = ['list', 'create', 'read', 'update', 'delete'];
  List<String> booksMethods = ['list', 'create', 'read', 'update', 'delete', 'export-html', 'export-pdf', 'export-plain-text', 'export-markdown'];
  List<String> chaptersMethods = ['list', 'create', 'read', 'update', 'delete', 'export-html', 'export-pdf', 'export-plain-text', 'export-markdown'];
  List<String> pagesMethods = ['list', 'create', 'read', 'update', 'delete', 'export-html', 'export-pdf', 'export-plain-text', 'export-markdown'];
  List<String> imageGalleryMethods = ['list', 'create', 'read', 'update', 'delete'];
  List<String> searchMethods = ['all'];
  List<String> shelvesMethods = ['list', 'create', 'read', 'update', 'delete'];
  List<String> usersMethods = ['list', 'create', 'read', 'update', 'delete'];
  List<String> rolesMethods = ['list', 'create', 'read', 'update', 'delete'];
  List<String> recycleBinMethods = ['list', 'restore', 'destroy'];
  List<String> contentPermissionsMethods = ['read', 'update'];

  bool menu = false;

  Map<String, List<String>> allMethods = {
    'ATTACHMENTS': [],
    'BOOKS': [],
    'CHAPTERS': [],
    'PAGES': [],
    'IMAGE_GALLERY': [],
    'SEARCH': [],
    'SHELVES': [],
    'USERS': [],
    'ROLES': [],
    'RECYCLE_BIN': [],
    'CONTENT_PERMISSIONS': [],
  };

  var response = '''
  NO REQUEST YET!!
  ''';

  @override
  void initState() {
    allMethods = {
      'ATTACHMENTS': attachmentsMethods,
      'BOOKS': booksMethods,
      'CHAPTERS': chaptersMethods,
      'PAGES': pagesMethods,
      'IMAGE_GALLERY': imageGalleryMethods,
      'SEARCH': searchMethods,
      'SHELVES': shelvesMethods,
      'USERS': usersMethods,
      'ROLES': rolesMethods,
      'RECYCLE_BIN': recycleBinMethods,
      'CONTENT_PERMISSIONS': contentPermissionsMethods,
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              menu ? menu = false : menu = true;
            });
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Text('<-- choose Method'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: menu,
              child: Column(
                children: allMethods.keys.map((category) {
                  List<String> methods = allMethods[category] ?? [];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: methods.length,
                          itemBuilder: (BuildContext context, int innerIndex) {
                            String methodName = methods[innerIndex];
                            return ElevatedButton(
                              onPressed: () async{
                                response = await methodsHandlerclass.mh(category, methodName);
                                setState(() {
                                  menu=false;
                                });
                              },
                              child: Text(methodName),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            const Divider(),
            const Text('Bookstack Response'),
            HighlightView(
              response,
              language: 'json',
              theme: a11yDarkTheme,
              padding: const EdgeInsets.all(12),
              textStyle: const TextStyle(
                fontFamily: 'My awesome monospace font',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
