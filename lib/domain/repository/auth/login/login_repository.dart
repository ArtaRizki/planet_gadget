abstract class ILoginRepository {
  Future<bool> login();
}

class LoginRepository implements ILoginRepository {
  @override
  Future<bool> login() async {
    return true;
  }
}
