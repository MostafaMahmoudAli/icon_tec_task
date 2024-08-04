import 'package:dio/dio.dart';


class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)
  {

    options.headers["Accept"] = ["application/json"];

    super.onRequest(options, handler);
  }
}
