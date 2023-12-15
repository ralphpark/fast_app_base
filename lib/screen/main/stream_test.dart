import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:flutter/material.dart';

void main(){
  // Stream 기본 개념
  //future는 한번만 값을 전달하지만, stream은 여러번 값을 전달할 수 있다.

  // Stream 생성과 수행
  // countStream(10).listen((event) { // listen : Stream을 수행하는 함수
  //   print(event);
  // });
  // Stream Controller
  final controller = StreamController<int>();
  final stream = controller.stream;
  stream.listen((event) {
    print(event);
  });
  addDataToTheSink(controller);
}

void addDataToTheSink(StreamController<int> controller) async{
  for(int i = 0; i < 4; i++){
    print('before add');
    controller.sink.add(i);
    print('after add');
    await sleepAsync(1.seconds);
  }
}
Stream<int> countStream(int max) async*{ // async* : Stream을 반환하는 함수
  for(int i = 0; i < max; i++){
    await sleepAsync(4.seconds);
    yield i; // yield : Stream에 값을 전달하는 키워드
  }
}

Future sleepAsync(Duration duration)  {
  return Future.delayed(duration);
}