import { Component} from '@angular/core';
import { Router } from '@angular/router';


import { User } from '../user/user.model';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent{

  user: User = new User();

  eventHandler(keyCode) {

 
    if(keyCode == 64 || keyCode == 124 || keyCode == 58 || keyCode == 43 || keyCode == 45 || keyCode == 46 || keyCode == 126 || keyCode == 96 || keyCode == 91 || keyCode == 123 || keyCode == 93 || keyCode == 125 || keyCode == 39 || keyCode == 34 || keyCode == 47 || keyCode == 44 || keyCode == 33 || keyCode == 36 || keyCode == 37 || keyCode == 38 || keyCode == 42 || keyCode == 40 || keyCode == 41)
    {
      
      alert("invalid character")
      location.reload();
      
      
    }
   
 } 

  constructor( private router: Router, private userService: UserService)  { }

  createUser(): void {
    this.userService.createUser(this.user)
        .subscribe( data => {
          alert("User created successfully.");
          console.log(data)
          this.router.navigate(['/login']);
        });

  };
}
