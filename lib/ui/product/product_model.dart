
class Product{
  final String product_name;
  final int product_id, product_mrp,product_price;

  const Product({this.product_id,this.product_name,this.product_mrp,this.product_price});
  
}

const kProduct = <Product>[
  Product(product_name: 'Product-1',product_id: 11,product_mrp: 1100,product_price: 190),
  Product(product_name: 'Product-2',product_id: 12,product_mrp: 1200,product_price: 290),
  Product(product_name: 'Product-3',product_id: 13,product_mrp: 1300,product_price: 390),
  Product(product_name: 'Product-4',product_id: 14,product_mrp: 1400,product_price: 490),
  Product(product_name: 'Product-5',product_id: 15,product_mrp: 1500,product_price: 590),
  Product(product_name: 'Product-6',product_id: 16,product_mrp: 1600,product_price: 690),
  Product(product_name: 'Product-7',product_id: 17,product_mrp: 1700,product_price: 790),
  Product(product_name: 'Product-8',product_id: 18,product_mrp: 1800,product_price: 890),
  Product(product_name: 'Product-9',product_id: 19,product_mrp: 1900,product_price: 990),
];