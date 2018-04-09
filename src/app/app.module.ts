import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import {HttpClientModule} from "@angular/common/http";
import { AppComponent } from './app.component';
import { UserComponent } from './user/user.component';
import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';
import { ROUTING } from './app.routing';
import { NotfoundComponent } from './notfound/notfound.component';
import { HomeComponent } from './home/home.component';
import { UserService } from './services/user.service';
import { UserDashboardComponent } from './user-dashboard/user-dashboard.component';
import {Location, CommonModule} from '@angular/common';
import { HttpModule } from '@angular/http';
import { CartComponent } from './cart/cart.component';
import { CheckOutComponent } from './check-out/check-out.component';
import { CheckOrderComponent } from './check-order/check-order.component';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {MatButtonModule, MatCheckboxModule} from '@angular/material'; 
import {MatTabsModule} from '@angular/material';
import {Md2SelectModule} from 'md2-select/select';
import {ReactiveFormsModule} from '@angular/forms';
import { DeliveryComponent } from './delivery/delivery.component';
import { ToastrModule } from 'ngx-toastr';
import { ToastrService } from './toastr-service.service';









@NgModule({
  declarations: [
    AppComponent,
    UserComponent,
    RegisterComponent,
    LoginComponent,
    NotfoundComponent,
    HomeComponent,
    UserDashboardComponent,
    CartComponent,
    CheckOutComponent,
    CheckOrderComponent,
    DeliveryComponent,
    
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    ROUTING,
    CommonModule,
    HttpModule,
    BrowserAnimationsModule,
    MatButtonModule, MatCheckboxModule, MatTabsModule,Md2SelectModule,
    ReactiveFormsModule,
    ToastrModule.forRoot(),
    
   

    
  ],
  providers: [UserService, ToastrService],
  bootstrap: [AppComponent]
})
export class AppModule { }
