import 'package:firebase_auth/firebase_auth.dart';
class FirebaseAuthService{
  FirebaseAuth _auth=FirebaseAuth.instance;
  Future<User?>signUpWithEmailAndpassword(String email,String password)async{
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email:email,password:password);
      return credential.user;
    }catch(e){
      print("Some error occurred");
    }
    return null;
  }


  Future<User?>signinWithEmailAndpassword(String email,String password)async{
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email:email,password:password);
      return credential.user;
    }catch(e){
      print("Some error occurred");
    }
    return null;
  }
}
