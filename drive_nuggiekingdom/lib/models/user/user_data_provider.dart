import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive_nuggiekingdom/models/user/user_authentication_provider.dart';
import 'package:drive_nuggiekingdom/models/user/user_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = StreamProvider<UserData>(
  (ref) {
    final userAuthentication = ref.watch(userAuthenticationProvider);

    var user = userAuthentication.value;

    if (user != null) {
      var docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      Stream<Map<String, dynamic>?> doc =
          docRef.snapshots().map((doc) => doc.data());

      /// TODO replace with stream to the cloud.
      UserData data = UserData();
      Stream<UserData> userStream = Stream.value(data);

      return userStream;
    } else {
      return const Stream.empty();
    }
  },
);
