var Product = /** @class */ (function () {
    function Product(id, name, qty, price) {
        var _this = this;
        this.purchase = function (qty) {
            _this.ProductQty -= qty;
        };
        this.GetProduct = function () {
            console.log("".concat(_this.ProductId, "\t\t").concat(_this.ProductName, "\t\t").concat(_this.ProductPrice, "\t\t").concat(_this.ProductQty));
        };
        this.orderProduct = function () {
            if (_this.ProductQty <= 5) {
                console.log("Reorder!!");
            }
        };
        this.ProductId = id;
        this.ProductName = name;
        this.ProductPrice = price;
        this.ProductQty = qty;
    }
    return Product;
}());
var productdata = [new Product(1, "Mobile", 20, 20000),
    new Product(2, "TV", 10, 40000),
    new Product(3, "Watch", 10, 50000),
    new Product(4, "Laptop", 10, 60000),
    new Product(5, "Airpods", 5, 40000)
];
var product = productdata.filter(function (x) {
    return x.ProductId == 2;
});
//console.log(product)              
product[0].purchase(7);
console.log("ProductId \t ProductName \t ProductPrice \t ProductQty");
for (var i = 0; i < productdata.length; i++) {
    productdata[i].orderProduct();
    productdata[i].GetProduct();
}
