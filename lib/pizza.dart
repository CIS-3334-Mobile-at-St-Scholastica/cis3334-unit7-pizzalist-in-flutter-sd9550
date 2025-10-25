class Pizza {
  static final PIZZA_PRICES = [7.99, 9.99, 12.99, 14.99];
  static final PIZZA_SIZES = ["Small", "Medium", "Large", "X-Large"];

  String toppings;
  String description = "";
  double price = 0;
  int size;
  int totalSize = 0;


  Pizza(this.toppings, this.size) {
    price = PIZZA_PRICES[size];
    description = "Toppings: $toppings\nSize: ${PIZZA_SIZES[size]}";
    totalSize = PIZZA_PRICES.length;
  }

  int getTotalSize() {
    return totalSize;
  }


  @override
  String toString() {
    return "$description\nPrice: \$$price";
  }


}