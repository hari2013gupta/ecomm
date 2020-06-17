import 'package:ecomm/ui/login/login_model.dart';
import 'package:ecomm/ui/login/presenter/login_presenter.dart';
import 'package:ecomm/utils/my_exception.dart';

class MockLoginRepository implements LoginRepository{
  @override
  Future<Customer> fetchLogin(String mobileNo, String password) {
    Customer c = new Customer(
        userId: 1,
        userName: 'hhhh',
        userPhoto: '',
        userPassword: '123456',
        userRating: '0',
        token: data,
        isActive: true,
        blockStatus: false,
      );
    return Future.value(c);
    throw new FetchDataException('Exception occured');
  }
LoginViewContract view;
  @override
  void loginView(LoginViewContract view) {
    // TODO: implement loginView
    this.view = view ;
  }

}

const data = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyIwIjp7InVzZXJfaWQiOjEsInVzZXJfbW9iaWxlIjoiODUxMDg4NzgyOCIsInVzZXJfbmFtZSI6ImhhcmkgZ3VwdGEiLCJ1c2VyX2VtYWlsIjoiaGsubWNhMDhAZ21haWwuY29tIiwidXNlcl9vdHAiOiI0Mjk3IiwidXNlcl9wYXNzd29yZCI6IiQyYSQwOCRMRGN1T2xEMHBSLkx4YnZoNlNMeHRlM3pPRGZFWThpUUQ2S2NVWDBMNzVBUHY0emF5UEtldSIsImRldmljZV90b2tlbiI6IiIsInVzZXJfcGhvdG8iOm51bGwsInVzZXJfYWN0aXZlIjoxLCJibG9ja19zdGF0dXMiOjAsImlzX2RlbGV0ZWQiOjAsInVzZXJfcmF0aW5nIjowLCJ1c2VyX3JlbWFyayI6bnVsbCwidXNlcl9jb21tZW50IjpudWxsLCJjcmVhdGVkX2F0IjoiMjAyMC0wNi0wNlQwMzo0Njo1MS4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMjAtMDYtMDZUMDM6NDY6NTEuMDAwWiJ9LCJpYXQiOjE1OTIzNzkxOTAsImV4cCI6MTU5MjM4MDYzMH0.kbucSGvcCyERgdYJYQVnrzvwpRDCtSDfv5C0Yov8LTg";
