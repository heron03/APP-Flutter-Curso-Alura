import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/login_interceptor.dart';


final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoginInterceptor()],
);

const String baseUrl = 'http://10.0.0.104:8080/transactions';
