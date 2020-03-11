import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoginInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('url ${data.url}');
    print('headers ${data.headers}');
    print('body ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
        print('url ${data.url}');
    print('headers ${data.headers}');
    print('body ${data.body}');
    return data;
  }
}

void findAll() async {
  final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoginInterceptor()],
  );
  final Response response = await client.get('http://10.0.0.103:8080/transactions');
}
