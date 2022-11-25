# FishModel
 - FishModel class의 값이 변경 되었을 때 이 Data와 관련있는 다른 위젯들에게    
   자동으로 이 사실을 열려 줄 수 있느냐가 관건 이고,    
   이로 인해 UI를 리빌드 할 수 있도록 어떻게 지시하는것도 관건이다.    
 - 이와 같은 기능을 구현하기 위해서 ChangeNotifier가 필요하다.

# 1. ChangeNotifier
### 1.1 notifyListeners method
  - ChangeNotifier내부에 notifyListeners라는 메소드가 존재 한다.
  - 이 메소드를 호출 하면 ChangeNotifier 클래스를 listen 하고 있는 모든 위젯들에게   
     Data가 변경 될 때마다 변경 사실을 알려 줄 수 있다.
  - 그럼 어떻게 하면 변경사실을 알 수 있도록 listen할 수 있을까?  addListener method이용

### 1.2 addListener method
  - addListener method를 호출해서 특정 Data가 변경 되었을때 listener Widget이 되도록 한다.
  - 이 method를 통해서 필요한 위젯 내에서 콜백메소드를 등록하면 된다.
  - addListener에 의해서 추가된 listener들에게 값이 변경 되었다는 사실을 알려 줄 수는 있지만   
    UI를 리빌드 시켜줄 수 는 없다.
  - removeListener method   
    . addListener는 자동으로 dispose가 되지 않기 때문에 필요없는 listener에 대해서   
      removeListener를 사용해서 해제 시켜 준다.
  - 단점
    1. 매번 수동으로 addListener를 등록시켜줘야 된다.   
    2. 수동으로 addListener를 removeListene를 통해서 제거시켜줘야 된다.   
    3. listen하고 있는 Widget들에게 class인 instance를 매번 생성자를 통해서 전달해야 한다.   
    4. UI리빌드도 수동으로 해결해야 한다.   

# 2. ChangeNotifierProvider
### 2.1 정의
 - ChangeNotifier의 단점을 보완하기 위해서 만들어 졌다.

### 1.2 장점
 1. 모든 위젯들이 listen할 수 있는 ChagneNotifier인스턴스 생성    
 2. 자동으로 필요 없는 ChagneNotifier제거    
 3. Provider.of를 통해서 위젯들이 쉽게 ChagneNotifier인스턴스에 접근할 수 있게 해준다.    
 4. 필용시 UI를 리빌드 시켜줄 수 있다.    
 5. 굳이 UI리빌드 할 필요가 없는 위젯을 위해서 listen:false기능을 제공 한다.    

# 3. MultiProvider
### 3.1 정의
  1. ChangeNotifierProvider가 2개 이상 존재 하면서 하나의 Widget에서 이 모두에게 접근해야 되는 경우에 사용

### 3.2 필요이유
  1. 만약, 여러 개의 Provider가 계층구조를 이룬다면 아래와 같은 구조일 것이다.
  
//       Provider (
//           
//       )
//    
//    
//    
//    
//    
//    
//  