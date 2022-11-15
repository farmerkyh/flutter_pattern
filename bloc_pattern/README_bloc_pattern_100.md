# Bloc Pattern

## 1. 강의, 참조 site
 - 선행 URL : https://youtu.be/2iWJRAcEsaQ 
 - 아래 Block Pattern을 듣기 전에 위 영상을 먼저 봐야됨. 아래 강의소스가 위 강의 소스를 가지고 진행하기 때문
 - Bloc Pattern 강의 URL : https://www.youtube.com/watch?v=EKwVNTyRPq0  (코딩 파파)


## 2. setStatus방식
 - 
<img src="./README_images/bloc_pattern_100_1.png">

### a. 위 image의 흐름기준으로 source 2본 개발
 -   첫번째소스, 위 image 왼쪽 flow
 -              setStatus() api를 사용하여 개발한 프로세스
 -   두번째소스, 위 image 오른쪽 flow
 -              StreamBuilder widget을 사용하여 개발한 프로세스

### b. 첫번째 소스 설명
 - 폴더 : block_pattern_010_none
 - _saved 변수를 Main dart소스에 초기 선언하고
 - _saved 변수를 사용하는 곳으로 넘겨준다.(객체이므로 referrence 방식으로 전송)
 - setState() api를 사용한다.

## 3. Bloc Pattern 방식
 - 파일명 : 
 - _saved 변수를 StreamBuilder widget을 이용해여 개발한 경우이다.
 - StreamBuilder widget을 사용하여 상태관리를 한다. (setState() api는 사용하지 않는다.)
 - _saved값이 변경 되면 바로 _saved가 사용되고 있는 양쪽 dart소스의 ListView로 보내주면서 refresh해준다.
 
## 2. Bloc Pattern  (Business LOgic Component Pattern)
<img src="./README_images/loc_pattern_100_2.png">




