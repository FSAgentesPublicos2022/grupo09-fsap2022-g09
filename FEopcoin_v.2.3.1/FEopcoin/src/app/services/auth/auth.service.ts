import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Usuario } from '../usuario.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  //url="https://reqres.in/api/login";    /* https://reqres.in/  "post login successful" - usuario: eve.holt@reqres.in  password:cityslicka - token:QpwL5tke4Pnpja7X4  */ 
  url = "https://localhost:44375/api/login/authenticate";
  loggedIn = new BehaviorSubject<boolean>(false);
  currentUserSubject: BehaviorSubject<Usuario>;
  currentUser: Observable<Usuario>;
  constructor(private http: HttpClient) {
    console.log("Servicio de Autenticación está corriendo");
    this.currentUserSubject = new BehaviorSubject<Usuario>(JSON.parse(localStorage.getItem('currentUser') || '{}')); ///


    this.currentUser = this.currentUserSubject.asObservable();
  }

  login(usuario: Usuario): Observable<any> {
    return this.http.post<any>(this.url, usuario)
      .pipe(map(data => {
       

        ///////////////////////////////////////////////////////////////////////////
        console.log("[*] (auth) Saving token ");
        localStorage.setItem("token", data);

        localStorage.setItem('currentUser', this.stringifyToken());
        console.log("[*] (Auth) CurrentUser: " + localStorage.getItem("currentUser"));
        ///////////////////////////////////////////////////////////////////////////
        
        localStorage.setItem("user", this.getClaim("unique_name")); ///// user log

        //localStorage.setItem('currentUser', JSON.stringify(data)); ////////
       
        this.currentUserSubject.next(data);
        this.loggedIn.next(true);
        console.log(data);

        return data;
      }));
  }


  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  getClaim(key: string): any {
    console.log("[*] (auth) Get Claim: " + key);
    let xstr = localStorage.getItem("token");
    if (xstr) {
      const payloadBase64 = xstr.split('.')[1];
      const payloadStr = atob(payloadBase64);
      const payloadJSObject = JSON.parse(payloadStr);
      xstr = payloadJSObject[key];
    }
    return xstr;
  }
  stringifyToken(): any {
    console.log("[*] (auth) stringifyToken()");
    let xstr = localStorage.getItem("token");
    if (xstr) {
      const payloadBase64 = xstr.split('.')[1];
      const payloadStr = atob(payloadBase64);
      const payloadJson = JSON.stringify(payloadStr);
      return payloadJson;
    }
    return "_NOT_PAYLOAD_FOUND_";
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////


  logout(): void {
    localStorage.removeItem('currentUser');
    ///////////////////////////////////////////////////////////////////////////
    localStorage.removeItem('token');
    ///////////////////////////////////////////////////////////////////////////
    localStorage.removeItem('user'); //user log
    //////////////////////////////////////////////////////////////////////
    this.loggedIn.next(false);

  }

  get usuarioAutenticado2(): Usuario {
    return this.currentUserSubject.value;
  }

  get usuarioAutenticado(): any {
    console.log("[*] (auth) usuarioAuthenticado: "+ this.currentUserSubject.value);
    return this.currentUserSubject.value;
  }

  get estaAutenticado(): Observable<boolean> {

    return this.loggedIn.asObservable();
  }
}


