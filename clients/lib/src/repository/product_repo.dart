import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductRepository {
  final _fireCloud = FirebaseFirestore.instance.collection('products');

  Future<void> create({required String name, required String price }) async {
    try {
      await _fireCloud.add({"name": name, "price": price });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("fail '${e.code} : ${e.message}'");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
