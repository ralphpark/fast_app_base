import 'package:fast_app_base/screen/main/tab/home/vo/vb_bank_account.dart';
import 'banks_dummy.dart';

final BankAccountShinhan1 = BankAccount(
  bankShinhan,
  1000000,
  accountTypeName: '신한 적금1',
);
final BankAccountShinhan2 = BankAccount(
  bankShinhan,
  3000000,
  accountTypeName: '신한 적금2',
);
final BankAccountShinhan3 = BankAccount(
  bankShinhan,
  20000000,
  accountTypeName: '신한 적금3',
);
final bankAccountKakao1 = BankAccount(
  bankKakao,
  1000000,
  accountTypeName: '카카오 적금1',
);
final bankAccountKakao2 = BankAccount(
  bankKakao,
  3000000,
  accountTypeName: '카카오 적금2',
);
final bankAccountToss1 = BankAccount(
  bankToss,
  1000000,
  accountTypeName: '토스 적금1',
);

final bankAccountToss2 = BankAccount(
  bankToss,
  3000000,
  accountTypeName: '토스 적금2',
);

final bankAccountToss3 = BankAccount(
  bankToss,
  20000000,
  accountTypeName: '토스 적금3',
);

final bankAccountToss4 = BankAccount(
  bankToss,
  1000000,
  accountTypeName: '토스 적금4',
);

final bankAccounts = [
  BankAccountShinhan1,
  BankAccountShinhan2,
  BankAccountShinhan3,
  bankAccountKakao1,
  bankAccountKakao2,
  bankAccountToss1,
  bankAccountToss2,
  bankAccountToss3,
  bankAccountToss4,
];

