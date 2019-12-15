

import '../constants.dart';

abstract class BaseRepository {

String getUrl(String apiUrl) {
  return getBaseUrl() + appEnv[apiUrl] + '?api_key=' + appEnv['API_KEY'];
}

String getBaseUrl() {
  switch(appEnv['ENVIROMENT']) {
    case 'LOCAL':
        return appEnv['DEV_API'];
        break;
    case 'DEV':
        return appEnv['DEV_API'];
        break;
    case 'PROD':
        return appEnv['PROD_API'];
        break;
    default:
        return appEnv['PROD_API'];
  }
}

}