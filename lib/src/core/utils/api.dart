import 'package:nt_news/src/core/utils/constant.dart';

class API {

  static final api_path     = kBaseUrl + "svc/";
  static final most_popular = api_path + "mostpopular/v2/mostviewed/all-sections/7.json?api-key=" + kAPIKey;

}