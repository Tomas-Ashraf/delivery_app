import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseService {
  static final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  static final FirebaseAuth fireBaseAuthInstance = FirebaseAuth.instance;
      

}
