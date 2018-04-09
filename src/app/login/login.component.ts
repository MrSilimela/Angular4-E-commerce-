import { User } from './../user/user.model';
import { Component} from '@angular/core';
import { Router } from '@angular/router';
import {ToastrService} from '../toastr-service.service';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent{ 
  user: User = new User();
  

  constructor( private router: Router, private userService: UserService,private toastrService:ToastrService) { }

  LoginUser(): void {
    this.userService.LoginUser(this.user)
        .subscribe( data => {
          let userEmail = this.user.username;
          localStorage.setItem('user', userEmail);
         this.router.navigate(['/UserDashboard']);
             
          
        });

   

  };
}
