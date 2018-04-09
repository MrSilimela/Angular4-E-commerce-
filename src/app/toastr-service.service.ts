import { Injectable } from '@angular/core';
declare var toastr:any

@Injectable()
export class ToastrService {

  constructor() { }

  Success(title: string,meassage?:string){
    toastr.success(title,meassage)
  }

  Warning(title: string,meassage?:string){
    toastr.warning(title,meassage)
  }

  Error(title: string,meassage?:string){
    toastr.error(title,meassage)
  }

  Info(title: string,meassage?:string){
    toastr.info(title,meassage)
  }
}
