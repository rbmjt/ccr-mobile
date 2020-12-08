import 'package:ccrwork_mobile/servicelocator.dart';

import 'navigationservice.dart';

class BootStrapper {
  static void initializeDIs() {
    locator.registerLazySingleton(() => NavigationService());
  }
}
