import "package:cloud_firestore/cloud_firestore.dart";

class ProductRepository{
  final instance =FirebaseFirestore.instance.collection("products");
  Future<dynamic> createProduct(Map<String,dynamic> data)async{
    try{
      final result =await instance.add(data);
      return result;
    }catch(e){
      print(e);
    }
  }

  Future<List<dynamic>> fetchAllProducts()async{
    try{
      final result =(await instance.get()).docs;
      return result;
    }catch(e){
      return [];

    }
  }
  Future<void> deleteProduct(String id)async{
    try{
      await instance.doc(id).delete();
    }catch(e){
      print(e);
      rethrow;
    }
  }

  Future<dynamic> getOneProduct(String id)async{
    try{
      final product = await instance.doc(id).get();
      return product;
    }catch(e){
      print(e);
      rethrow;
    }
  }
  Future<dynamic> UpdateProduct(String id, Map<String, dynamic> data) async{
    try{
      await instance.doc(id).set(data);
    }catch(e){
      rethrow;
    }
  }

}

