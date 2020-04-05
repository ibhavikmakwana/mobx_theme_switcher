import 'package:http/http.dart' as http;
import 'package:mobxthemeswitcher/model/Album.dart';

class Repository {
  Future<List<Album>> fetchAlbum() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums');
    if (response.statusCode == 200) {
      return albumFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
