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
 - assets/images/
 - assets/icons/

```

### home_page.dart 수정
- appbar 파라미터 수정 
- buildAppBar 자동 추가

```js
appBar: buildAppBar(), 

```

## 3. buildAppBar() 수정 및 Constant 추가 


### constants.dart 추가 
- lib/constants.dart 추가 

```js
class Constants{
    static double kPadding = 8.0;
}
```


### buildAppBar() 수정, AppBar actions: avatar 추가 
- height 추가 
```js
Image.asset("assets/logo/amazon.png", height: 25)


```
- actions 추가 

```js

AppBar(
    actions: [
        Padding(padding: const EdgetInsets.all(Constants.kPadding),
            child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.jpeg")
            )
        )
    ],
)
```
- CircleAvatar(backgroundImage )



## 4. Scaffold body 추가, header.dart 추가 


### scaffold body 추가 
- body에 SingleChildScrollView() 추가를 한다.
- singlechild이기에 Column을 추가하여 children을 추가한다. 

```js
return Scaffold(
    appBar: buildAppBar(),
    body: SingleChildScrollView(
        child: Column(
            children: [],
        ),
    ),
);

```


### header.dart 만들기
- lib/home/widgets/header.dart 
- im '' fm 추가 
- buildHeader() 함수 추가 
- scaffold body의 column children에 들어갈 것임 
- left 와 top을 주었음 body에서 Column에서 EdgeInsets.all() 하여서 주었음 
```js
List<Widget> buildHeader() => [
    Padding(
        paddding: EdgeInsets.only(
            left: 2 * Constants.kPadding,
            top: Constants.kPadding,
        ),
        child: Text(
            "Bookshelf",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
            ),
        ),
    ),
    Padding(
        paddding: EdgeInsets.symmetric(
            horizontal: 2 * Constants.kPadding,
            vertical: Constants.kPadding,
        ),
        child: Text(
            "Welcome Flutter Mappers",
            style: TextStyle(
                color: Colors.black54,
            ),
        ),
    ),
];
```
- 숫자 먼저 쓰는 습관을 들이고 있다. 나도 숫자먼저 쓰는 습관을 들이자. 

#### Padding Wigdet 
- padding: 얼마나 padding을 줄것인지 EdgeInsets.only(left: 2 * Constants.kPadding, top) 나는 오직 여기에만 줄것이다. 
- child: padding 안에 들어갈 내용 
- child: Text("bookshelf", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),)
- Text를 얼마나 줄 것인지를 정한다. 



## home_page.dart > Scaffold body에 추가 
- Scaffold(appBar에는 추가 하였음)
- Scaffold(body에 추가를 하면 됨)
- buildHeader() ... 을 이용하여서 추가함. 
- 아마 깊은 복사일 듯? 
```js
return Scaffold(
    appBar: buildAppBar(),
    body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 이거 추가해줘야함 
            children: [...buildHeader()],
        ),
    ),
);

```

## 5. search_bar.dart 생성 buildSearch() 함수 생성 
- home > widgets > search_bar.dart 

```js
import 'fm';

Widget buildSearchBar() => Padding(
    padding: EdgeInsets.all(2 * Constants.kPadding),
    child: TextField(
        decoration: InputDecoration(
            hintText: "Search a book",
            fillCOlor: Colors.black.withOpacity(0.1), // filled 같이 써야 함 
            filled: true, 
            prefixIcon: Icon(Icons.search), // hintText 앞에 아이콘을 넣을 수 있음 
            contentPadding: const EdgetInsets.symmetric(
                vertical: 0.0,
                horizontal: Constants.kPadding,
            ), // 안에 있는 콘텐츠들을 padding을 주게 만듦 
            border: OutLineInputBorder( // border 속성으로 InputBorder class임 입력할 때의 Border를 말하는 것 같음  type이 Input 
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none
            ),
        ),
    ),
);
```


## 6. icons_list.dart 생성, buildIconsList() 생성 / models폴더 Icons_list.dart 생성 
- import ''; fm

```js

final List<IconModel> headerImages = IconModel.icons 

Widget buildIconsList() => Padding(
    padding: EdgeInsets.only(bottom: COnstants.kPadding),
    child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, 
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                headerImages.length,
                (index) => Container(
                    width: 100,
                    child: Column(
                        children: [Image.asset(headerImages[index].icon),],
                    ),
                ), 
            ),
        ),
    ),
);

```


### models 폴더 icons_list.dart 생성 
- models > icons_list.dart 

```js
class IconModel {
    String icon;
    String title;

    IconModel({
        required this.icon,
        required thos.title,
    });

    static List<IconModel> icons = [
        IconModel(
            icon: "assets/icons/icon_1.png", 
            title: "Discover",
        ), 
        IconModel(
            icon: "assets/icons/icon_2.png", 
            title: "Arbitrary",
        ), 
        IconModel(
            icon: "assets/icons/icon_3.png", 
            title: "Author Nearby",
        ), 
        IconModel(
            icon: "assets/icons/icon_4.png", 
            title: "WorldWide",
        ), 
        IconModel(
            icon: "assets/icons/icon_5.png", 
            title: "Audio Book",
        ), 
        IconModel(
            icon: "assets/icons/icon_6.png", 
            title: "Quick Search",
        ), 
        IconModel(
            icon: "assets/icons/icon_7.png", 
            title: "My Country",
        ), 

    ];
}

```

- buildIconsList() 추가하기 
```js
children: [
              ...buildHeader(),
              buildSearchBar(),
              buildIconsList(),
            ],
```


### scrollBehavior 추가 

```js
scrollBehavior: MaterialScrollBehavior().copywith(
    dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
    },
),

```


## 7.BookList 생성 
- widgets > books_list.dart

```js
import '' fm; 

class BuildBookList extends StatelessWidget {

    @override

    Widget build(BuildContext context) {
        return Container(
            width: double.infinity,
            color: Colors.black.withOpacity(0.1),
            child: Column(
                children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Constants.kPadding,
                            horizontal: Contants.kPadding * 2, 
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxixAlignment.spacebetween,
                            chilren: [
                                Text("Best Sellers", 
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                    ),    
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("See all"),
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.0,
                                            horizontal: Constants.kPadding,
                                        ),
                                        backgroundColor: Colors.deepOrange,
                                        primary: Colors.white,
                                        minimumSize: SIze(5, 5),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRaidus.circular(20.0),
                                        ),
                                    ),
                                ),

                            ],
                        ),
                    ),
                ]
            ),
        );
    }


}

```

## 8. BookModel 생성 

### BookModel 생성
- lib > models > book_model.dart 생성

```js
class BookModel {
    String image;
    STring secondImage;
    String title;
    STring subtitle;
    bool favorite;

    BookModel({
        required this.image,
        required this.secondImage,
        required this.title,
        required this.subtitle,
        required this.favorite,
    });

    static List<BookModel> books = [
        BookModel(
            image: "assets/images/book_1.jpeg",
            secondImae: "assets/images/book_1.jpeg",
            title: "The Martian",
            subtitle: "Andy Weir",
            favorite: false,

        ),

    ]

}

```


### books_list.dart 수정
- lib > pages > home > widgets > books_list.dart 수정



```js
SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            books.length,
            (index) => Padding(
                padding: EdgeInsets.only(
                    bottom: Constants.kPadding * 2,
                    right: Constants.kPadding,
                    left: index == 0 ? Constants.kPadding : 0,
                ),
                child: InkWell(
                    onTap: () {
                        //TODO 
                        //We will trigger somthing later

                    },
                    child: Column(children:[
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BoderRadius.circular(10.0),
                                ),
                                elevation: 4,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                        book[index].image,
                                        height: 180,
                                        width: 120,
                                        fit: BoxFit.coover,
                                    )
                                ),
                            ),
                            Container(
                                width: 120,
                                child: Text(
                                    book[index].title,
                                )
                            ),
                            Container(
                                width: 120,
                                child: Text(
                                    book[index].subtitle,
                                    style:
                                        TextStyle(
                                            fontSize: 10, 
                                            color: Colors.blueGrey,
                                        )
                                )
                            ),
                        ],
                    ),
                ),
            ),
        ) 
    ),
)

```
