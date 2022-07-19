import 'dart:ui';

import 'package:logger/logger.dart';

class ToolMethods {
  @pragma('vm:entry-point')
  static void downloadCallback(id, status, progress) {
    final logger = Logger(printer: PrettyPrinter());
    logger.i('action: downloadCallback, taskId: $id,'
        ' status: $status, progress: $progress');
    try {
      final send = IsolateNameServer.lookupPortByName('downloader_send_port');
      send?.send([id, status, progress]);
    } catch (e) {
      logger.w('action: downloadCallbackFailed, exception: $e');
    }
  }

  static void unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }
}
