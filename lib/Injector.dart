import 'package:get_it/get_it.dart';
import 'package:nt_news/src/data/datasources/remote/http_parser.dart';

final injector = GetIt.instance;

Future<void> initializeDependancies() async{
  injector.registerLazySingleton<HttpParser>(() => HttpParser());
}