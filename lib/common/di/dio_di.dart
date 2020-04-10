import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@registerModule
abstract class DioDi {
  @lazySingleton
  Dio get dio => Dio();
}
