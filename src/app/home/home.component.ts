import { Component, OnInit, Input } from '@angular/core';
import { HttpClient} from '@angular/common/http';
import { Http } from '@angular/http';
import { Router } from '@angular/router';
import {ToastrService} from '../toastr-service.service'


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent{

  allProducts:AllProducts

  constructor(private httpService: HttpClient, private http: Http, private router: Router,private toastrService:ToastrService){
  
  }

  ngOnInit(): void {
    this.httpService.get<AllProducts>("/GetProducts").subscribe(products => {
    this.allProducts = products;
    console.log(products)
    });

}
onSelect(){
  this.toastrService.Warning("Oops!! you not logged in. Please login or simple go to register if you don't have an acount")
  //this.router.navigate(['/login']);

}

}

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
