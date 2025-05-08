import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'device_storage_api.dart';

class FlutterSecureStorageApi implements IDeviceStorageApi {
  const FlutterSecureStorageApi();
  static const storage = FlutterSecureStorage();

  @override
  Future<void> deleteValue(String key) async {
    await storage.delete(key: key);
    await storage.deleteAll();
  }

  @override
  Future<String?> getValue(String key) async {
    //const storage = FlutterSecureStorage();
    return storage.read(key: key);
  }

  @override
  Future<void> storeValue({required String key, required String value}) async {
    //const storage = FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }
}
