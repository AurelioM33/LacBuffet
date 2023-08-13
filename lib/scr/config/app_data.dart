// ignore_for_file: non_constant_identifier_names

import 'package:lac_buffet/scr/models/cart_item_model.dart';
import 'package:lac_buffet/scr/models/item_model.dart';
import 'package:lac_buffet/scr/models/user_model.dart';

import '../models/order_model.dart';

ItemModel Cake = ItemModel(
  description: 'Melhor Bolo com custo beneficio da região!!!! ',
  imfUrl: 'assets/cakes/bolo1.png',
  itemname: 'Bolo 1',
  price: 85,
  unit: 'uni',
);
ItemModel Cake2 = ItemModel(
  description: 'Melhor Bolo com custo beneficio da região!!!! ',
  imfUrl: 'assets/cakes/bolo2.png',
  itemname: 'Bolo 2',
  price: 85,
  unit: 'uni',
);
ItemModel Cake3 = ItemModel(
  description: 'Melhor Bolo com custo beneficio da região!!!! ',
  imfUrl: 'assets/cakes/bolo3.png',
  itemname: 'Bolo 3',
  price: 85,
  unit: 'uni',
);
ItemModel Cake4 = ItemModel(
  description: 'Melhor Bolo com custo beneficio da região!!!! ',
  imfUrl: 'assets/cakes/bolo4.png',
  itemname: 'Bolo 4',
  price: 85,
  unit: 'uni',
);
ItemModel Cake5 = ItemModel(
  description: 'Melhor Bolo com custo beneficio da região!!!! ',
  imfUrl: 'assets/cakes/bolo5.png',
  itemname: 'Bolo 5',
  price: 85,
  unit: 'uni',
);
ItemModel Cake6 = ItemModel(
  description: 'Melhor Bolo com custo beneficio da região!!!! ',
  imfUrl: 'assets/cakes/bolo6.png',
  itemname: 'Bolo 6',
  price: 85,
  unit: 'uni',
);

List<ItemModel> items = [
  Cake,
  Cake2,
  Cake3,
  Cake4,
  Cake5,
  Cake6,
];

List<String> categories = [
  'Bolos',
  'Doces',
  'Bolos De Pote',
  'Copos Felicidade',
  'Salgados',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: Cake,
    quantity: 1,
    id: '',
  ),
  CartItemModel(
    item: Cake3,
    quantity: 1,
    id: '',
  ),
  CartItemModel(
    item: Cake2,
    quantity: 2,
    id: '',
  ),
];

UserModel user = UserModel(
  phone: '99 9999-9999',
  cpf: '999.999.999-99',
  email: 'marcoaurelio.m.m@hotmail.com',
  name: 'Marco Aurélio',
  password: 'm123456',
);

List<OrderModel> orders = [
  //Pedido 01

  /*OrderModel(
    copyAndPaste: 'asdsadasda',
    createdDateTime: DateTime.parse(
      '2023-06-08 10:00:10.458',
    ),
    overduaDateTime: DateTime.parse(
      '2023-06-08 11:00:10.458',
    ),
    id: 'aksdsakdksadksad',
    status: 'pending_payment',
    total: 168,
    items: [
      CartItemModel(
        item: Cake,
        quantity: 2,
        id: '',
      ),
      CartItemModel(
        item: Cake2,
        quantity: 2,
        id: '',
      ),
    ],
  ),

  //Pedido 02

  OrderModel(
    copyAndPaste: 'asdsadasda',
    createdDateTime: DateTime.parse(
      '2023-06-08 10:00:10.458',
    ),
    overduaDateTime: DateTime.parse(
      '2023-06-08 11:00:10.458',
    ),
    id: 'aksdsakdksadksad',
    status: 'delivered',
    total: 168,
    items: [
      CartItemModel(
        item: Cake3,
        quantity: 4,
        id: '',
      ),
    ],
  ),*/
];
