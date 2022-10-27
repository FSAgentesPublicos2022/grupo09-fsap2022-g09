import { Component, OnInit } from '@angular/core';
import { EmailValidator } from '@angular/forms';
import { AuthService } from 'src/app/services/auth/auth.service';
import { UsuarioService,  Usuario } from 'src/app/services/usuario.service';
import { IniciarSesionComponent } from '../iniciar-sesion/iniciar-sesion.component';








@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  [x: string]: any;
  
  //usuarioLogueado = "Usuario1"; //
  //usuarioLogueado = localStorage.getItem("currentUser");
  usuarioLogueado = localStorage.getItem("user");
  
  
  

  
  
  
  constructor(private usuarioService: UsuarioService,) { }

  ngOnInit(): void {  }

 



  

}
