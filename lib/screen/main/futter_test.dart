
import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_account_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vb_bank_account.dart';

void main()async{
  //Future의 생성과 수행
  // print('start');
  // final account = await getBankAccounts();
  // print(account.toString());
  // print('end');

  //Future TimeOut
  print('start');
  try{
    final result = await getBankAccounts().timeout(1.seconds);
    print(result);
  } catch(e){
    print(e);
  }
  print('end');
  // final result = await getBankAccounts().timeout(1.seconds).onError((error, stackTrace) => []);
  // print(result);
  // print('end');
}
//FutureOr
abstract class DoworkInterface{
  @override
  void doWork();
}

class SyncWork extends DoworkInterface{
  @override
  void doWork() {
    print('SyncWork');
  }
}

class AsyncWork extends DoworkInterface{
  @override
  Future doWork() async{
    print('AsyncWork');
  }
}



Future<List<BankAccount>> getBankAccounts() async{
  await sleepAsync(4.seconds);
  return bankAccounts;
}



Future sleepAsync(Duration duration)  {
  return Future.delayed(duration);
}