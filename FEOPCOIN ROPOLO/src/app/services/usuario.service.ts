import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { Observable } from 'rxjs';

export class Usuario
{
  //nombre:string="";
  //apellido:string="";
  //dni:string="";
  //fechaNacimiento:string="";
  password:string="";
  email:string="";
  id:number=0;
  token?: string;
  
  
  ID_Rol:number = 2;
  NombreUsuario:string = ""; 
  //NombreUsuario:string = "test6@acme.com";   
  //FechaHoraAlta:any = "2020-03-05T00:00:00"
 
}


@Injectable({
  providedIn: 'root'
})

  //A modo de ejemplo se deja así pero lo ideal es crear propiedades para acceder a los atributos.
 
 
  export class UsuarioService {
    //url="https://reqres.in/api/users/1";       /* https://reqres.in/   "Get Single user" */
    url="https://localhost:44367/api/Usuarios";

    constructor(private http:HttpClient) {
      console.log("Servicio Usuarios está corriendo");
     }
  
    crearUsuario(usuario:Usuario):Observable<Usuario>{
      return this.http.post<Usuario>(this.url, usuario);
      
    }
  }
    
