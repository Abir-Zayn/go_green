import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart' as models;

// Client client = Client().setProject('67a8928d001d6e0a0851');

// Account account = Account(client);

class AppwriteService {
  static const String projectId = "67a8928d001d6e0a0851";
  static const String endpoint = "";

  late final Client client;
  late final Account account;

  AppwriteService() {
    client = Client().setProject(projectId);
    account = Account(client);
  }

  //Get the current logged on user session details
  Future<models.User?> getCurrentUser() async {
    try {
      return await account.get();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<models.User?> signInWithGoogle() async {
    try {
      final session = await account.createOAuth2Session(
          provider: OAuthProvider.google, scopes: ['profile', 'email']);
      final user = await account.get();
      return user;
    } catch (e) {
      throw Exception("Google Sign in failed $e");
    }
  }

  // Future<models.User?> signInWithFacebook() async {
  //   try {
  //     final session = await account.createOAuth2Session(provider: 'facebook');
  //     final user = await account.get();
  //     return user;
  //   } catch (e) {
  //     throw Exception("Google Sign in failed $e");
  //   }
  // }

  //Sign out the current user
  Future<void> SignOut() async {
    try {
      await account.deleteSession(sessionId: 'current');
    } catch (e) {
      print(e);
    }
  }
}
