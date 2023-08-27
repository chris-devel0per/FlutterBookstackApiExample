import 'attachments.dart';
import 'books.dart';
import 'chapters.dart';
import 'pages.dart';
import 'image_gallery.dart';
import 'search.dart';
import 'shelves.dart';
import 'users.dart';
import 'roles.dart';
import 'reycle_bin.dart';
import 'content_permissions.dart';

import 'dart:convert';


class MethodsHandler {

  Future<String> mh(String group, String function) async {
    Attachments aC = Attachments();
    Books bC = Books();
    Chapters cC = Chapters();
    Pages pC = Pages();
    image_gallery iC = image_gallery();
    Search seC = Search();
    Shelves shC = Shelves();
    Users uC = Users();
    Roles roC = Roles();
    RecycleBin reC = RecycleBin();
    ContentPermissions cpC = ContentPermissions();

    String response = '';

    if (group == 'ATTACHMENTS') {
      if (function == 'list') {
        response = await aC.list();
      } else if (function == 'create') {
        response = await aC.create();
      } else if (function == 'read') {
        response = await aC.read();
      } else if (function == 'update') {
        response = await aC.update();
      } else if (function == 'delete') {
        response = await aC.delete();
      }
    } else if (group == 'BOOKS') {
      if (function == 'list') {
        response = await bC.list();
      } else if (function == 'create') {
        response = await bC.create();
      } else if (function == 'read') {
        response = await bC.read();
      } else if (function == 'update') {
        response = await bC.update();
      } else if (function == 'delete') {
        response = await bC.delete();
      } else if (function == 'export-html') {
        response = await bC.exportHtml();
      } else if (function == 'export-pdf') {
        response = await bC.exportPdf();
      } else if (function == 'export-plain-text') {
        response = await bC.exportPlain();
      } else if (function == 'export-markdown') {
        response = await bC.exportMarkdown();
      }
    } else if (group == 'CHAPTERS') {
      if (function == 'list') {
        response = await cC.list();
      } else if (function == 'create') {
        response = await cC.create();
      } else if (function == 'read') {
        response = await cC.read();
      } else if (function == 'update') {
        response = await cC.update();
      } else if (function == 'delete') {
        response = await cC.delete();
      } else if (function == 'export-html') {
        response = await cC.exportHtml();
      } else if (function == 'export-pdf') {
        response = await cC.exportPdf();
      } else if (function == 'export-plain-text') {
        response = await cC.exportPlain();
      } else if (function == 'export-markdown') {
        response = await cC.exportMarkdown();
      }
    }else if (group == 'PAGES') {
      if (function == 'list') {
        response = await pC.list();
      } else if (function == 'create') {
        response = await pC.create();
      } else if (function == 'read') {
        response = await pC.read();
      } else if (function == 'update') {
        response = await pC.update();
      } else if (function == 'delete') {
        response = await pC.delete();
      } else if (function == 'export-html') {
        response = await pC.exportHtml();
      } else if (function == 'export-pdf') {
        response = await pC.exportPdf();
      } else if (function == 'export-plain-text') {
        response = await pC.exportPlain();
      } else if (function == 'export-markdown') {
        response = await pC.exportMarkdown();
      }
    }else if (group == 'IMAGE_GALLERY') {
      if (function == 'list') {
        response = await iC.list();
      } else if (function == 'create') {
        response = await iC.create();
      } else if (function == 'read') {
        response = await iC.read();
      } else if (function == 'update') {
        response = await iC.update();
      } else if (function == 'delete') {
        response = await iC.delete();
      }
    }else if (group == 'SEARCH') {
      if (function == 'all') {
        response = await seC.all();
      }
    }else if (group == 'SHELVES') {
      if (function == 'list') {
        response = await shC.list();
      } else if (function == 'create') {
        response = await shC.create();
      } else if (function == 'read') {
        response = await shC.read();
      } else if (function == 'update') {
        response = await shC.update();
      } else if (function == 'delete') {
        response = await shC.delete();
      }
    }else if (group == 'USERS') {
      if (function == 'list') {
        response = await uC.list();
      } else if (function == 'create') {
        response = await uC.create();
      } else if (function == 'read') {
        response = await uC.read();
      } else if (function == 'update') {
        response = await uC.update();
      } else if (function == 'delete') {
        response = await uC.delete();
      }
    }else if (group == 'ROLES') {
      if (function == 'list') {
        response = await roC.list();
      } else if (function == 'create') {
        response = await roC.create();
      } else if (function == 'read') {
        response = await roC.read();
      } else if (function == 'update') {
        response = await roC.update();
      } else if (function == 'delete') {
        response = await roC.delete();
      }
    }else if (group == 'RECYCLE_BIN') {
      if (function == 'list') {
        response = await reC.list();
      } else if (function == 'restore') {
        response = 'THIS METHOD IS CURRENTLY NOT SUPPORTED';
      } else if (function == 'destroy') {
        response = 'THIS METHOD IS CURRENTLY NOT SUPPORTED';
      }
    }else if (group == 'CONTENT_PERMISSIONS') {
      if (function == 'read') {
        response = await cpC.read();
      } else if (function == 'update') {
        response = 'THIS METHOD IS CURRENTLY NOT SUPPORTED';
      }
    }


    try {
      // Parse the original JSON data
      var parsedJson = json.decode(response);

      // Encode the parsed JSON data with indentation for readability
      response = const JsonEncoder.withIndent('  ').convert(parsedJson);
    } on Exception catch (_) {


    }

    return response;
  }
}