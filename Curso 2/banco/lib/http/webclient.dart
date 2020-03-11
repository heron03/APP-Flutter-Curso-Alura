import 'package:http/http.dart';

void findAll() async {
  final Response response = await get('http://10.0.0.103:8080/transactions');
  print(response.body);
}