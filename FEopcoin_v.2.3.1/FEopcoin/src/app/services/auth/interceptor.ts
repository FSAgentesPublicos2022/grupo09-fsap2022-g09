import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})



export class JwtInterceptor implements HttpInterceptor {

  constructor(private authService: AuthService) { }

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

    const currentUser = this.authService.usuarioAutenticado;
    console.log("INTERCEPTOR: " + currentUser);
    
    const currentUserDecode = this.authService.getClaim("unique_name");
    console.log("INTERCEPTOR current username: " + currentUserDecode);

    
   


    ////////////////////if (currentUser && currentUser.token) {
    if (currentUser && localStorage.getItem("token")) { 
      console.log("[*] (interceptor) Sending  with token");
      req = req.clone({
        setHeaders: {

          //Authorization: `Bearer ${currentUser.token}`
          Authorization: `Bearer ${localStorage.getItem("token")}`

        }
      });

    } else { console.log("[*] (interceptor) Sending  without token") }


    return next.handle(req);
  }

}










