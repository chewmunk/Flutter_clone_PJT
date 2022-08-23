# 220823

## 1. 폴더 생성 및 main.dart 

### 폴더 생성(pages/book, pages/home)
- pages/book 폴더 생성 
- pages/home 폴더 생성 

### 파일 생성(pages/book, pages/home)
- pages/book/book_page.dart 
- pages/home/home_page.dart 

### 파일 내용 추가(home_page.dart)
- home_page.dart 
- import '' 입력 
- fm 을 써준다. (''사이에)
- stl을 써준다. stateless widget
- stf는 stateful widget
- HomePage라는 이름으로 해줌 
- const key constructor 를 삭제해준다. 
- return에는 Scaffold()를 추가함.  

### main.dart 내용 삭제 
- MaterialApp의 home 파라미터 HomePage()를 제외하고 나머지를 다 삭제한다. 
- home 파라미터에 HomePage()를 넣는다. 
- debugShwoCheckedModeBanner: false, 를 넣어준다. 


## 2 home_page.dart, app_bar.dart, 이미지 추가 


### home_page.dart 추가 
- Scaffold(appBar:) 까지 쓰기로 함


### pages/home/widgets 폴더 및 파일 생성   
- pages/home/widgets 폴더 생성

### app_bar.dart 파일 생성 
- pages/home/widgets/app_bar.dart 파일생성 
- AppBar라고 입력 알아서 import 됨
- 함수를 정의 해줌
- return_type function_name => AppBar(); 
```js
AppBar buildAppBar() => AppBar(
 backgroundColor: Colors.transparent,
 elevation: 0,
 centerTitle: false, 
 title: Image.asset("assets/logo/amazon.png"),

); // 
```

### 이미지 폴덧 생성 및 추가 
- assets/images 폴더 생성
- assets/icons 폴더 생성 
- book 관련 이미지는 images 폴더
- icons 이미지는 icons 폴더에 


### pubspec.yaml 수정
- assets 파라미터 주석 해제 


```yaml
assets:
 - assets/images
 - assets/icons

```

### home_page.dart 수정
- appbar 파라미터 수정 
- buildAppBar 자동 추가

```js
appBar: buildAppBar(), 

```



