
---------------------------------------------
- https://www.youtube.com/watch?v=-3iD7f3e_SU&t=3s
- https://www.youtube.com/watch?v=de6tAJS2ZG0
1. Flutter dev 공식 추천
2. 가장 보편적
3. Provider의 개선모델인 Riverpod를 출시했음
4. 

Data종류
1. 앱수준의 데이터
   - 서버에서 data를 조회 후 화면에 보여주는 데이터
2. 위젯 수준의 데이터 
   - 체크박스의 상태등이 변경 시 해당 값들을 유지하는 값들

setState method 문제점
1. 비효율성
 - 많은 widget중 하나만 변경 되었는데, 모든 widget을 모두 rebuild해야 되기 때문에 불필요한 렌더링을 해야 된다.
2. 동시에 다른 위젯의 state를 업데이터 시켜주지 못함

State mangement정의
1. 위젯이 쉽게 데이터에 접근할 수 있는 방법
2. 변화된 데이터에 맞추어서 UI를 다시 그려주는 기능이 있어야 함.

Provider전달 시 형태
- final fish = Provider.of<Salmon>(context);
.Provider : 전달행위를 하는 객체 (Provider도 사실 widget이다.)
.<Salmon> : 전달 되는 값
.(context) : 전달경로
  - 전달행위를 하는 객체는 전달 되는 값을 전달경로를 통해서 필요한 곳에 전달해 준다.