import 'dart:io';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:flutter/material.dart';


//Generator : Iterable과 Stream을 반환하는 함수
Future<void> main() async {
  // List와 Iterable
  // final List list = ['blue', 'yellow', 'red'];
  // final iterator = list.iterator; // iterator는 순서대로 무언가를 할수 있다는 의미
  // print (iterator.current);
  // while(iterator.moveNext()){
  //   print(iterator.current);
  // }
  // list.forEach((element) {
  //   print(element);
  // });
  // for(final element in list){ // 리스트는 iterable이기 때문에 for문으로도 순회가 가능하다.
  // //   print(element);
  // }
  // for (final element in countIterable(5)){
  //   print(element);
  // }
  await for(final element in countStream(5)){
    print(element);
  }
}

// sync* : Iterable을 반환하는 함수
Iterable<String> countIterable(int max) sync*{
  for(int i = 0; i < max; i++){
    // sleep(1.seconds); // sleep 함수는 쓰레드를 아예 꺼버리기때문에 위험하다.
    yield i.toString(); // yield : Iterable에 값을 전달하는 키워드
  }
  yield '새배복 많이 받으세요';
  yield* ["1","2","3","4"]; // yield* : Iterable을 전달하는 키워드
}


Stream<int> countStream(int max) async*{ // async* : Stream을 반환하는 함수
  for(int i = 0; i < max; i++){
    await sleepAsync(4.seconds);
    yield i; // yield : Stream에 값을 전달하는 키워드
  }
  yield 100;
}

Future sleepAsync(Duration duration)  {
  return Future.delayed(duration);
}