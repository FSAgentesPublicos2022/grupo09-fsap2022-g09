import { Injectable } from '@angular/core';
import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class ErrorInterceptor implements HttpInterceptor {

    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        return next.handle(req).pipe(catchError(err => {
          if (err.status === 401) {
            console.log("[*] (errpr) Making reload");
            //location.reload();
          }if (err.status === 409){alert("El usuario ya existe")}  ///
    
          const error = err.error.message || err.statusText;
          return throwError(error);
        }));
      }

      

      

  
}
