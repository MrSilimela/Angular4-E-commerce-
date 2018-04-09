import { Component, OnInit, Input } from '@angular/core';
import { HttpClient} from '@angular/common/http';
import { Http } from '@angular/http';
import { Router } from '@angular/router';
import {ToastrService} from '../toastr-service.service'

@Component({
  selector: 'app-user-dashboard',
  templateUrl: './user-dashboard.component.html',
  styleUrls: ['./user-dashboard.component.css']
})
export class UserDashboardComponent implements OnInit {

  title = 'app';
  allProducts:AllProducts
  beverages:AllProducts
  freshFood:AllProducts
  foodCupboard:AllProducts
  frozenFood:AllProducts
  meals:AllProducts
  baby:AllProducts
  health:AllProducts
  office:AllProducts
  outdoor:AllProducts
  household:AllProducts
  allCarts:AllCarts
  total: any = 0;
  cart = [];
  
  

  //Get loged in User
  get userLogedIn(): any {
    return localStorage.getItem('user');
}

  
  constructor(private httpService: HttpClient, private http: Http, private router: Router,private toastrService:ToastrService) {
  
  }

  onLogOut(){
  alert("Thank you for shopping with us. See you soon!!")
  localStorage.removeItem('user');
  console.log("good bye")
  this.router.navigate(['/login']);
}


  onSelect(product:Product)

   { 

    let productID =0;
    let CartPos =0;

    const userLogedIn = localStorage.getItem('user');
    this.httpService.get<Array<CartItems>>("/viewCart" +"/" + userLogedIn).subscribe(cartData => {
         this.cart = cartData;


         for ( var i = 0; i < cartData.length; i++ ){
           if(cartData[i].product_id == product.product_id)
           {
            productID = product.product_id;
            CartPos = i;
         
           } 
     
        
      }

      if(product.product_id == productID)
      {

         let CartID = cartData[CartPos].cart_id;
       let qnty = cartData[CartPos].cart_quantity + 1;
       
       let UpdateCart = {
       "cart_id" : cartData[CartPos].cart_id,
       "user_name" : localStorage.getItem('user'),
       "cart_price" : cartData[CartPos].cart_price,
       "cart_quantity" : qnty,
       "product_name" : cartData[CartPos].product_name,
        "product_id" : cartData[CartPos].product_id,
       "product_img" :cartData[CartPos].product_img,};


       
       const res = this.http.put('/UpdateCart'+ '/' + '' + CartID,UpdateCart 
     
       )
           .subscribe(
             res => {
               console.log(res);
               this.toastrService.Success("Product added successful to cart")               
              
             },
             err => {
               console.log("Error occured");
               alert("Cart update unsuccessfull");
               location.reload();
             }
           );
      } else{
       const res = this.http.post('/SaveCart', 
       {user_name:localStorage.getItem('user'),
        product_id: product.product_id,
        product_name: product.product_name,
        product_img: product.product_img,
        cart_quantity: 1,
        cart_price: product.product_price,
      
       }    
     )
       .subscribe(
         res => {
           console.log(res);
           this.toastrService.Success("Product added successful to cart")
         },
         err => {
           console.log("Error occured");
           alert("product NOT Added to cart");
         }
       );
      }


    });

 }


  ngOnInit(): void {
  this.httpService.get<AllProducts>("/GetProducts").subscribe(products => {
  this.allProducts = products;
  });

  //getting only fresh food from products
  this.httpService.get<AllProducts>("/ProductCategory" +"/" + 1).subscribe(products => {
   this.freshFood = products;
    });

    //getting only food cupboard from products
  this.httpService.get<AllProducts>("/ProductCategory" +"/" + 2).subscribe(products => {
   this.foodCupboard = products;
    });

       //getting only frozen food from products
  this.httpService.get<AllProducts>("/ProductCategory" +"/" + 3).subscribe(products => {
    this.frozenFood = products;
    });

         //getting only meals from products
  this.httpService.get<AllProducts>("/ProductCategory" +"/" + 4).subscribe(products => {
    this.meals = products;
    });

  //getting only beverages from products
  this.httpService.get<AllProducts>("/ProductCategory" +"/" + 5).subscribe(products => {
 this.beverages = products;
  });

  //getting only baby from products
  this.httpService.get<AllProducts>("/ProductCategory" +"/" + 6).subscribe(products => {
   this.baby = products;
    });

    //getting only beverages from products
  this.httpService.get<AllProducts>("/ProductCategory" +"/" + 7).subscribe(products => {
  this.health = products;
    });

    //getting only office from products
  this.httpService.get<AllProducts>("/ProductCategory" +"/" + 8).subscribe(products => {
   this.office = products;
    });

     //getting only outdoor from products
  this.httpService.get<AllProducts>("/ProductCategory" +"/" + 9).subscribe(products => {
   this.outdoor = products;
    });

       //getting only outdoor from products
  this.httpService.get<AllProducts>("/ProductCategory" +"/" + 10).subscribe(products => {
    this.household = products;
    });




  this.httpService.get<AllCarts>("/GetCarts").subscribe(carts => {
   this.allCarts = carts;
    });

   
    this.toastrService.Success("Welcome to our Online Shopping site. We hope you enjoy your shopping experience with us. ")
 

  }

  }
  const userEmail =  localStorage.getItem('user');
 //Get all products
      interface Product {
        product_id: number;
        product_name:String;
        category_id: number;
        product_price:number;
        product_img:String;
      }

       interface AllProducts {
        allProducts: Product[]
        }

        //Get all carts
        interface Cart {
          cart_id: number;
         user_name:String;
        cart_quantity: number;
        cart_price:number;
        product_img:String;
        product_name:String;
        product_id: number;
        }
        interface AllCarts {
          allCarts: Cart[]
          }


          interface CartItems{
            cart_id
            product_id
            product_name
            product_img
            cart_quantity
            cart_price
            user_name
          }

        



       

        
