import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<String>> getSkills();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<List<String>> getSkills() async {
    //TODO: Fix the problem with server
    final data = await http.get(Uri.parse('__ADD_ADDRESS_HERE__'));
    // print(data.body);
    return ['Unity3D', 'English', 'Flutter', 'Poems', 'Videogames'];
  }
}
