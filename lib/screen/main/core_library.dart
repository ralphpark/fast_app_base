
main (){
  String content = '과일들:';
  //스트링을 연달아서 붙여주고 구분자를 붙여주는 역할을 하는 것이 StringBuffer이다.
  StringBuffer stringBuffer = StringBuffer(content);
  stringBuffer.writeAll(['사과', '바나나', '포도', '수박', '참외'], ',');
  print(stringBuffer.toString());


  // 정규식 : regular expression
  // 정규식은 문자열을 검색하고 대체하는데 사용하는 패턴이다.

  // 주소내 숫자를 찾아주는 예시
  final findNumber = RegExp(r'\d+'); // r : raw string
  const exampleUriPath = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EC%8A%A4%ED%88%AC%EC%8B%9C%EC%BD%94%EB%A6%AC%EC%95%84';
  final matches = findNumber.allMatches(exampleUriPath);
  for (final match in matches){
    final matchString = exampleUriPath.substring(match.start, match.end);
    print(matchString);
  }

  // 문장에서 해시태그를 찾아주는 예시
  final findHashTagRegExp = RegExp(r'(#[\d a-zA-Z0-9가-힣]*)');
  const exampleSentence = '안녕하세요 #플러터 #개발자 #코딩 #해시태그 #테스트 입니다.';

  final hashTagMatches = findHashTagRegExp.allMatches(exampleSentence);
  for (final match in hashTagMatches){
    final matchString = exampleSentence.substring(match.start, match.end);
    print(matchString);
  }

  //  Uri
  // Uri는 URL을 파싱하고 생성하는데 사용하는 클래스이다.
  // Uri는 3가지로 구성되어 있다.
  // 1. scheme : 프로토콜
  // 2. authority : 호스트
  // 3. path : 경로
  // 4. query : 쿼리 파라미터
  // 5. fragment : 프래그먼트
  final uri = Uri.parse(exampleUriPath);
  print(uri.scheme);
  print(uri.authority);
  print(uri.path);

  for (final pathSegment in uri.pathSegments){
    print(pathSegment);
  }

  final params = uri.queryParametersAll;
  final param4 = params['color[]'];
  print(param4);

}