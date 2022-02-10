import 'package:firebase_database/firebase_database.dart';

//   FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
// FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);
void retrieve() async {
  print('retreive');
  // DatabaseReference ref = FirebaseDatabase.instance.ref("bikes");
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

// Get the data once
  DatabaseEvent event = await ref.once();
// Print the data of the snapshot
  print(event.snapshot.value); // { "name": "John" }

// Get the Stream
  Stream<DatabaseEvent> stream = ref.onValue;

// Subscribe to the stream!
  stream.listen((DatabaseEvent event) {
    print('Event Type: ${event.type}'); // DatabaseEventType.value;
    print('Snapshot: ${event.snapshot}'); // DataSnapshot
  });
}

