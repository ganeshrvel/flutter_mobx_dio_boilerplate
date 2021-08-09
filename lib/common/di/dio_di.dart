import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioDi {
  @LazySingleton()
  Dio get dio => Dio();
}
