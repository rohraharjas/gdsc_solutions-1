import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in Anon
  Future signInAnon() async{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
  }

}

class AppUser{
  String name, email_id, username, password, location;

  AppUser({
    required this.name,
    required this.email_id,
    required this.username,
    required this.password,
    required this.location,
  });

}

class Donor extends AppUser{
  int age, weight;
  String blood_type, gender, last_donation_date;

  Donor({
    required String name,
    required String email_id,
    required String username,
    required String password,
    required String location,
    required this.age,
    required this.weight,
    required this.blood_type,
    required this.gender,
    required this.last_donation_date,
}) : super(
    name: name,
    email_id: email_id,
    password: password,
    username: 'don$username',
    location: location
  );
}

class Representative extends AppUser{
  int rating;
  String about;
  Representative({
    required String name,
    required String email_id,
    required String username,
    required String password,
    required String location,
    required this.about,
    this.rating = 0,
}):super(
      name: name,
      email_id: email_id,
      username: 'rep$username',
      password: password,
      location: location
  );
}