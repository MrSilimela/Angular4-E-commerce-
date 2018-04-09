import { Component, OnInit, Input } from '@angular/core';
import { HttpClient} from '@angular/common/http';
import { Http } from '@angular/http';
import { Router } from '@angular/router';
import {FormControl } from '@angular/forms';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import {ToastrService} from '../toastr-service.service'

@Component({
  selector: 'app-check-order',
  templateUrl: './check-order.component.html',
  styleUrls: ['./check-order.component.css']
})
export class CheckOrderComponent implements OnInit {

  showSelected: boolean;
  OrdersArray=[];
  UserOrder=[];
  orders:Orders
  orders2:Orders2
  rForm: FormGroup;
  post:any;
  userOrders:UserOrders
  total: any;

       //Get loged in User
       get userLogedIn(): any {
        return localStorage.getItem('user');}


constructor(private httpService: HttpClient, private http: Http, private router: Router, private fb: FormBuilder,private toastrService:ToastrService) {

  this.rForm = fb.group({
    'order':[null, Validators.required],
    'validate' : ''
  });
  this.showSelected = false;
 }

 onLogOut(){
  alert("Thank you for shopping with us. See you soon!!")
  localStorage.removeItem('user');
  console.log("good bye")
  this.router.navigate(['/login']);
}

 addPost(post) {
  let orderID = post.order;
  localStorage.setItem('orderId', orderID);
     //getting only outdoor from products
     this.httpService.get<Array<OrderItems>>("/CheckedOrder" +"/" + orderID).subscribe(orderData => {
      this.UserOrder = orderData;

      var orderTotal = 0;
      for ( var i = 0; i < orderData.length; i++ ){
        orderTotal += orderData[i].cart_price * orderData[i].cart_quantity
      }
      this.total = orderTotal.toFixed(2);
      console.log ( this.total )
});

this.showSelected = true;
console.log(orderID);
}

deleteOrder(userOrder:UserOrder){
  localStorage.getItem('orderId');
  console.log(localStorage.getItem('orderId'))

       //getting only outdoor from products
       this.httpService.get<Array<OrderItems>>("/CheckedOrder" +"/" +  localStorage.getItem('orderId')).subscribe(orderData => {
        this.UserOrder = orderData;
        console.log(orderData)
        var orderTotal = 0;
        for ( var i = 0; i < orderData.length; i++ ){
         if(localStorage.getItem('orderId') == orderData[i].order_id){

          const req = this.httpService.delete('/DeleteCheckedOrders'+'/'+ orderData[i].checked_id)
          .subscribe(req =>{
          console.log("Success");
      },
 err =>{
   console.log("ERROR")
 }
);

         }

        }
        const req = this.httpService.delete('/DeleteOrders'+'/'+ localStorage.getItem('orderId'))
        .subscribe(req =>{
        console.log("Success");
       this.toastrService.Success("Order deleted.")
       setTimeout(
       function(){ 
       location.reload(); 
       }, 500);
},
err =>{
 console.log("ERROR")
}
);


        
       
  });

  

}

  ngOnInit() {

    this.httpService.get<Array<Orders>>("/UserOrders" +"/" + localStorage.getItem('user')).subscribe(ordersData => {
      this.OrdersArray = ordersData;      
      console.log("OrdersArray", this.OrdersArray)
    
    
    });

  }

}

interface Orders {
  orders: Orders[]
  }

  interface Orders2 {
    orders: UserOrder[]
    }


interface Orders {
  order_id
  user_name
  payment_id
  order_status
    
}

//Get all Cheched out orders
interface UserOrder {
   cart_id
 user_name
cart_quantity
cart_price
product_img
product_name
product_id
order_id
}

interface UserOrders {
  userOrders: UserOrder[]
  }

  interface OrderItems{
    checked_id
    cart_id
    product_id
    product_name
    product_img
    cart_quantity
    cart_price
    user_name
    order_id
  }