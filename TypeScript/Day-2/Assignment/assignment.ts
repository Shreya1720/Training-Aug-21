interface Iproduct {
        ProductId : number;
        ProductName : string;
        ProductQty : number ;
        ProductPrice : number ;
        GetProduct:()=>any;
}
class Product implements Iproduct{
        ProductId : number;
        ProductName : string;
        ProductQty : number ;
        ProductPrice : number ;
    constructor(id : number , name : string , qty:number , price : number ) {
        this.ProductId = id;
        this.ProductName = name;
        this.ProductPrice = price;
        this.ProductQty = qty; 
    }

    purchase = (qty : number)=>{
        this.ProductQty-=qty;
    };

   GetProduct = () : void =>{
        console.log(`${this.ProductId}\t\t${this.ProductName}\t\t${this.ProductPrice}\t\t${this.ProductQty}`)
    };

    orderProduct =() : void=>{
        if(this.ProductQty <5){
            console.log("Reorder!!")
        }
    }
}
let productdata : any[] = [   new Product(1,"Mobile", 20,20000), 
                            new Product(2,"TV",10,40000),
                            new Product(3,"Watch",10,50000),
                            new Product(4,"Laptop",10,60000),
                            new Product(5,"Airpods",5,40000)
                        ]
var product = productdata.filter(function (x){
                            return x.ProductId == 2;
                        })
//console.log(product)              
product[0].purchase(7);
console.log("ProductId \t ProductName \t ProductPrice \t ProductQty")

for(var i =0 ; i<productdata.length ; i++)
{
    productdata[i].orderProduct();
    productdata[i].GetProduct();  
}

