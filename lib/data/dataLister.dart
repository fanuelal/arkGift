import '../providers/product.dart';
import '../providers/catagory.dart';

final catagoryList = [
  Catagory(
      id: 'c1',
      title: 'BirthDay Gifts',
      imgUrl:
          'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
  Catagory(
      id: 'c2',
      title: 'Couple Gifts',
      imgUrl:
          'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
  Catagory(
      id: 'c3',
      title: 'Random Gifts',
      imgUrl:
          'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
  Catagory(
      id: 'c4',
      title: 'Anversary Gifts',
      imgUrl:
          'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
  Catagory(
      id: 'c5',
      title: 'Friend Gifts',
      imgUrl:
          'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
  Catagory(
      id: 'c6',
      title: 'Child Gifts',
      imgUrl:
          'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
  Catagory(
      id: 'c7',
      title: 'For Male',
      imgUrl:
          'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
  Catagory(
      id: 'c8',
      title: 'For Female',
      imgUrl:
          'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
];
final productList = [
  Product(
      id: 'p01',
      name: "Iphone 12 Pro Max",
      Discription:
          "Pricing starts at 1,099. The iPhone 12 Pro Max is the largest phone of the iPhone 12 series. It has an A14 Bionic chip which has a 50% faster CPU and GPU. It has a 6.7-inch screen size which is the largest iPhone ever.",
      imgUrl: [
        "https://m.media-amazon.com/images/I/51EkZsk8XYL._AC_SX425_.jpg",
        "https://m.media-amazon.com/images/I/61tSnUoFeJL._AC_SX425_.jpg",
        "https://m.media-amazon.com/images/I/61DsANM1PaL._AC_SX425_.jpg"
      ],
      price: 1099,
      rate: 4.5,
      catagorizedIn: ['c1', 'c2', 'c3'],
      amount: 20),
  Product(
      id: 'p02',
      name: "SweatShirt",
      Discription:
          "Pricing starts at 1,099. The iPhone 12 Pro Max is the largest phone of the iPhone 12 series. It has an A14 Bionic chip which has a 50% faster CPU and GPU. It has a 6.7-inch screen size which is the largest iPhone ever.",
      imgUrl: [
        "https://www.pngitem.com/pimgs/m/117-1171479_sweatshirt-png-clip-art-transparent-background-clothing-png.png",
      ],
      price: 1099,
      rate: 4.75,
      catagorizedIn: ['c1', 'c2', 'c7'],
      amount: 70),
  Product(
      id: 'p03',
      name: "Sweet Box",
      Discription:
          "Pricing starts at 1,099. The iPhone 12 Pro Max is the largest phone of the iPhone 12 series. It has an A14 Bionic chip which has a 50% faster CPU and GPU. It has a 6.7-inch screen size which is the largest iPhone ever.",
      imgUrl: [
        "https://www.pngitem.com/pimgs/m/212-2126804_clipart-present-sweet-box-hd-png-download.png",
      ],
      price: 1099,
      rate: 4,
      catagorizedIn: ['c1', 'c2', 'c3'],
      amount: 70),
];
