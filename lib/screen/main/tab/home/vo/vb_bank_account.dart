import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank.dart';

class BankAccount{
  final Bank bank; // 변할수 없는것
  final String accountNumber; // 변할수 없는것
  final String accountHolder; // 변할수 없는것
  int balance; // 변할수 있는것
  final String? accountTypeName; // nullable로 설정해서 값이 들어오지 않아도 에러가 나지 않도록 ? 설정

  BankAccount(
    this.bank,
    this.accountNumber,
    this.accountHolder,
    this.balance, {
    this.accountTypeName, //{}로 설정해서 값이 들어오지 않아도 에러가 나지 않도록 ? 설정
  });
}