import 'package:meta/meta.dart';

class RouteRedirectModel {
  String routeName;
  Object arguments;

  RouteRedirectModel({
    @required this.routeName,
    this.arguments,
  });
}
