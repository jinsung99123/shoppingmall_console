// 수정 내용: count가 Map에 같이 담겨 호출이 되어야 하는데 그러지 않았기에, 장바구니에 담을 상품에 맞는 '개수'를 연동시키지 못하는 코드 오류 수정 시도
// 현재 count는 if 조건문의 조건식에만 참여하고 그 후 상품이름과 같이 객체에 담겨야 하는데 묶지를 못 했음.
// 수정 후: cart라는 Map컬렉션의 Value에 Map을 추가해 가격과 개수로 묶어주었고 새로운 키로 할당하여 값을 받도록 함.

import 'dart:io';

void main() {}

class ShoppingMall {
  Map<String, int> product = {
    'shirts': 45000,
    'onepiece': 30000,
    'Tshirt': 35000,
    'pants': 38000,
    'socks': 5000,
  }; // 상품 클래스 선언과 product 객체 선언

  Map<String, Map<String, int>> cart = {}; // 장바구니 객체 선언

  void showMenu() {
    while (true) {
      print('[1] 상품 목록 보기');
      print('[2] 장바구니에 담기');
      print('[3] 장바구니에 담긴 상품의 총 가격 보기');
      print('[4] 프로그램 종료');

      String inputData = stdin.readLineSync()!;

      switch (inputData) {
        case '1':
          showProduct();
          break;
        case '2':
          addCart();
          break;
        case '3':
          showAllPrice();
          break;
        case '4':
          print('프로그램이 종료됩니다.');
          return;
      }
    }
  }

  void showProduct() {
    print('상품 목록:');
    product.forEach((key, value) {
      print('$key : $value');
    });
  }

  void addCart() {
    print('상품 이름을 입력해주세요.');
    String inputNameData = stdin.readLineSync()!;

    if (product.containsKey(inputNameData)) {
      print('상품 개수를 입력해주세요.');
      String inputCountData = stdin.readLineSync()!;
      var count = int.parse(inputCountData);
      if (count > 0) {
        print('장바구니에 상품이 담겼어요!');
        cart[inputNameData] = {
          'price': product[inputNameData]!,
          'count': count,
        };
      } else
        print("0개보다 많은 개수의 상품만 담을 수 있어요!");
    } else
      print('입력값이 올바르지 않아요.');
  }

  void showAllPrice() {
    int allprice = 0;
    cart.forEach((key, value) {
      allprice += (value['price']! * value['count']!);
      
    });
    print('장바구니에 $allprice원 어치를 담으셨네요!');
  }
}

// addCart에 입력한 상품명이 product 객체의 key와 같을 시 cart 객체에 해당 Map Product의 key와 value를 저장. showallprice 에서 객체에 담긴 value와 addcart에서 입력받은 개수를 곱해서 출력
// cart.forEach((key, value){ int allprice = 0; allprice += (value*count)
