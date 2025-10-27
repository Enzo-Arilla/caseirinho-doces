/*
  Backend - 

  - Rest para cliente e servidor
  - Socket.io para stream

  Singleton
*/

import 'package:dio/dio.dart';

import '../model/user.dart';

class RestProviderUser {
  static RestProviderUser helper = RestProviderUser._();
  RestProviderUser._();

  Dio dio = Dio();
  String baseUrl = "https://caseirinho-doces-default-rtdb.firebaseio.com";

  insertUser(UserProfile user) {
    dio.post("$baseUrl/.json", data: user.toMap());
  }

  Future<UserProfile?> getUserByEmail(String email) async {
    try {
      final orderBy = Uri.encodeQueryComponent('"email"');
      final equalTo = Uri.encodeQueryComponent('"$email"');

      final url = '$baseUrl/users.json?orderBy=$orderBy&equalTo=$equalTo';

      Response res = await dio.get(url);

      if (res.data == null || res.data is! Map) {
        return null;
      }

      Map data = res.data as Map;

      if (data.isNotEmpty) {
        final firstUserData = data.values.first;
        return UserProfile.fromMap(firstUserData);
      }

      return null;
    } catch (e) {
      print('Erro no getUserByEmail: $e');
      return null;
    }
}

  /*deleteNote(String noteId) {
    dio.delete("$baseUrl/notes/$noteId");
  }

  update(UserProfile user) {
    dio.put("$baseUrl/notes/${note.id}", data: note.toMap());
  }

  Future<Note> getNote(String noteId) async {
    Response res = await dio.get("$baseUrl/notes/$noteId");
    Map aux = res.data;
    aux["id"] = noteId;

    return Note.fromMap(aux);
  }

  Future<List<Note>> getNoteList() async {
    Response res = await dio.get("$baseUrl/notes/");

    List<Note> noteList = [];

    res.data.forEach((key, value) {
      value["id"] = key;
      Note note = Note.fromMap(value);
      noteList.add(note);
    });

    return noteList;
  }

  Stream get stream {
    controller ??= StreamController();

    Socket socket =
        io(baseUrl, OptionBuilder().setTransports(['websocket']).build());

    socket.on("server_information", (data) {
      controller!.sink.add("invalidate");
    });

    return controller!.stream;
  }

  StreamController? controller;*/
}
