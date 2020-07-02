import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CounterState extends GetxController {
  RxInt counter = 0.obs;

  StreamController<int> streamController = StreamController<int>();

  void startStream() {
    Stream<DocumentSnapshot> doc =
        Firestore.instance.collection("counters").document("apple").snapshots();

    doc.listen((event) {
      streamController.sink.add(event.data["stock"]);
    });
  }

  void increment() {
    counter.value++;
  }

  void onClose() {
    streamController.close();
    super.onClose();
  }
}
