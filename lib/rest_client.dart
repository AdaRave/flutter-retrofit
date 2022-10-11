import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_test_1/feelings.dart';

part 'rest_client.g.dart'; //название должно быть похоже на текущий файл
@RestApi(baseUrl: "http://mskko2021.mad.hakta.pro/api/")
abstract class RestClient{
  factory RestClient (Dio dio, {String baseUrl}) = _RestClient;
  //_RestClient генерируется автоматически с помощью команды в терминал

  @GET("/feelings")
  Future<Feelings> getTasks();
}

