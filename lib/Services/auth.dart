import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in Anon
  Future signInAnon() async {
    UserCredential result = await _auth.signInAnonymously();
    User? user = result.user;
    return user;
  }
}

class AppUser {
  String name, emailId, username, password, location;

  AppUser({
    required this.name,
    required this.emailId,
    required this.username,
    required this.password,
    required this.location,
  });
}

class Donor extends AppUser {
  int age, height;
  double weight;
  String bloodType, gender, lastDonationDate;

  Donor({
    required String name,
    required String emailId,
    required String username,
    required String password,
    required String location,
    required this.age,
    required this.weight,
    required this.height,
    required this.bloodType,
    required this.gender,
    required this.lastDonationDate,
  }) : super(
            name: name,
            emailId: emailId,
            password: password,
            username: 'don$username',
            location: location);
}

class Representative extends AppUser {
  int rating;
  String about;
  Representative({
    required String name,
    required String emailId,
    required String username,
    required String password,
    required String location,
    required this.about,
    this.rating = 0,
  }) : super(
            name: name,
            emailId: emailId,
            username: 'rep$username',
            password: password,
            location: location);
}
