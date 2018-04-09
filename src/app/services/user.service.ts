import {Injectable} from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { User } from '../user/user.model';


const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable()
export class UserService {

  constructor(private http:HttpClient) {}

  private userUrl = 'http://localhost:9000/user/service/send/all/user';
  private userUrlRegister = 'http://localhost:9000/user/service/register';
  private userUrlLogin = 'http://localhost:9000/user/service/login';


  public getUsers() {
    return this.http.get(this.userUrl);
  }

  public deleteUser(user) {
    return this.http.delete(this.userUrl + "/"+ user.id);
  }

  public createUser(user) {
    return this.http.post(this.userUrlRegister, user);
  }

  public LoginUser(user) {
    return this.http.post(this.userUrlLogin, user);
  }

}