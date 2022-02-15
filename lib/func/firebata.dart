import 'package:bicycle_flutter/view/components/map/markers.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FireData {
  // static late Set<Marker> markers = {};
  static Future init() async {
//   FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
// FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);
    print('retreive');
    DatabaseReference ref = FirebaseDatabase.instance.ref("bikes");
    // DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
    // MarkerData md;
// Get the data once
    DatabaseEvent event = await ref.once();
// Print the data of the snapshot
    // print(event.snapshot.value.runtimeType);
    var fetchedData = event.snapshot.value as Map;
    MarkerData.setBikeMarkers(fetchedData);
    // .then(
    //   (value) {
    //     print('then vlaue = $value');
    //     markers = value;
    //     print(markers);
    //   },
    // );

    // print(markers);
    // print('가져온 데이터 $fetchedData');
    // print('타입 ${fetchedData.runtimeType}'); // { "name": "John" }
    // fetchedData.forEach((key, value) {
    //   print(key);
    //   print(value);
    // });
    // setBikeMarkers(event.snapshot.value);
// Get the Stream
    // Stream<DatabaseEvent> stream = ref.onValue;
    // print(stream.runtimeType);
// Subscribe to the stream!
    // stream.listen((DatabaseEvent event) {
    //   print("리얼타임 스트림 데이터");
    //   print('Event Type: ${event.type}'); // DatabaseEventType.value;
    //   print('Snapshot: ${event.snapshot}'); // DataSnapshot
    //   print('Snapshot자식들: ${event.snapshot.value}'); // DataSnapshot
    //   Map<dynamic, dynamic> bikesData =
    //       event.snapshot.value as Map<dynamic, dynamic>;
    //   List<dynamic> listData = bikesData.entries
    //       .map(
    //         (e) => e.key,
    //       )
    //       .toList();
    //   print('컨버트한 데이터 ${listData}');

    // });
  }
}
