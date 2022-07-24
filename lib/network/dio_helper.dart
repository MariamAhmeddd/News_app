import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        //connectTimeout: 5000,
        //receiveTimeout: 3000,
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getDataFromDio(
  {
    required String url
    , required Map<String, dynamic> query,
  }
)async
  {
    return await dio.get(url , queryParameters: query,);
  }
}