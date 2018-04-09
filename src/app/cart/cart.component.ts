import { Cart } from './../model/cart.model';
import { Http } from '@angular/http';
import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import {ToastrService} from '../toastr-service.service'



@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {

  title = 'app';
  allCarts:AllCarts
  total: any;
  OrdersArray=[];

  cart = [];



    //Get loged in User
    get userLogedIn(): any {
      return localStorage.getItem('user');
  }

  get GetTotal(): any {
    return localStorage.getItem(localStorage.getItem('userCartTotal'));
}

onLogOut(){
  alert("Thank you for shopping with us. See you soon!!")
  localStorage.removeItem('user');
  console.log("good bye")
  this.router.navigate(['/login']);
}

checkTotal()
{
  if(this.total == 0){
   
    this.toastrService.Info("Oops!!! Your cart is Empty. Please add products to your cart before proceeding to check out")
   
  } else{ this.router.navigate(['/checkOut']); }
}
checkOrder(){
  this.httpService.get<Array<Orders>>("/UserOrders" +"/" + localStorage.getItem('user')).subscribe(ordersData => {
    this.OrdersArray = ordersData;
    
     if(ordersData.length <1)
     {
       this.toastrService.Info("Sorry you do not have any orders at this moment to view")
     }else{
      this.router.navigate(['/checkOrders']);
     }
 });
}

deleteCart(cart: Cart)
{ let cartId = cart.cart_id;
  const req = this.httpService.delete('/DeleteCart'+'/'+ cartId)
  .subscribe(req =>{
      console.log("Success");
      this.toastrService.Success("Product deleted from cart.")
      setTimeout(
         function(){ 
         location.reload(); 
         }, 500);
  },
  err =>{
    console.log("ERROR")
  }
);
}

Decrmnt(cart: Cart)

{ 
  let CartQnty = cart.cart_quantity;
  console.log(CartQnty)
  if(CartQnty > 1){

  let CartID = cart.cart_id;
  let qnty = cart.cart_quantity - 1;
  let UpdateCart = {
  "cart_id" : cart.cart_id,
  "user_name" : localStorage.getItem('user'),
  "cart_price" : cart.cart_price,
  "cart_quantity" : qnty,
  "product_name" : cart.product_name,
   "product_id" : cart.product_id,
  "product_img" : cart.product_img,};
  
  const res = this.http.put('/UpdateCart'+ '/' + '' + CartID,UpdateCart 

  )
      .subscribe(
        res => {
          console.log(res);
        
          this.toastrService.Success("Product quantity updated")
         setTimeout(
            function(){ 
            location.reload(); 
            }, 500);
        },
        err => {
          console.log("Error occured");
          alert("Cart update unsuccessfull");
        }
      );
  

}
  
}

Inccrmnt(cart: Cart)
{
  console.log(cart.cart_id)
let CartID = cart.cart_id;
let qnty = cart.cart_quantity + 1;
let UpdateCart = {
"cart_id" : cart.cart_id,
"user_name" : localStorage.getItem('user'),
"cart_price" : cart.cart_price,
"cart_quantity" : qnty,
"product_name" : cart.product_name,
 "product_id" : cart.product_id,
"product_img" : cart.product_img,}; 

console.log(UpdateCart)
                       	              
  const res = this.http.put('/UpdateCart'+ '/' + '' + CartID,UpdateCart 

  )
      .subscribe(
        res => {
          console.log(res);
          this.toastrService.Success("Product quantity updated")
          setTimeout(
            function(){ 
            location.reload(); 
            }, 500);
        },
        err => {
          console.log("Error occured");
          alert("Cart update unsuccessfull");
        }
      );
  
  }
 

  constructor(private httpService: HttpClient, private http: Http, private router: Router,private toastrService:ToastrService) { }

  ngOnInit(): void  {
    const userLogedIn = localStorage.getItem('user');
    this.httpService.get<Array<CartItems>>("/viewCart" +"/" + userLogedIn).subscribe(cartData => {
         this.cart = cartData;


      var cartTotal = 0;
      for ( var i = 0; i < cartData.length; i++ ){
        cartTotal += cartData[i].cart_price * cartData[i].cart_quantity
      }
      localStorage.setItem( 'userCartTotal', JSON.stringify(cartTotal) )

      this.total = cartTotal.toFixed(2);
      console.log ( this.total )
    
    

    });

  }
 
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

interface Orders {
  order_id
  user_name
  payment_id
  order_status
    
}

      

     