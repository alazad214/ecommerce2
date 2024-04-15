import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Card_Controller extends GetxController {
  final cards = FirebaseAuth.instance.currentUser!;

  Add_toCard(QueryDocumentSnapshot product) {
    FirebaseFirestore.instance
        .collection("cards")
        .doc(cards.email)
        .collection("card")
        .add({
      "email": cards.email,
      "product id": product.id,
      "name": product["name"],
      "image": product["image"],
      "o_price": product["d_price"],
      "d_price": product["o_price"],
      "quantity": 1
    }).then((value) => Get.snackbar(
            "Successfully", "Product successfully added to card "));
  }
}