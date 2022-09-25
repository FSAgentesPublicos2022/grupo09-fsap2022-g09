import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ServiciosComponent } from './servicios/servicios.component';

import { RegistroComponent } from './registro/registro.component';
import { IniciarSesionComponent } from './iniciar-sesion/iniciar-sesion.component';
import { Pagina404Component } from './pagina404/pagina404.component';

import { RouterModule } from '@angular/router';
import { OperacionesComponent } from './operaciones/operaciones.component';
import { TransaccionesComponent } from './transacciones/transacciones.component';
import { CriptomonedaComponent } from './criptomoneda/criptomoneda.component';
import { HomeComponent } from './home/home.component';
import { MovimientosComponent } from './movimientos/movimientos.component';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    ServiciosComponent,
   
    RegistroComponent,
    IniciarSesionComponent,
    Pagina404Component,
    
    OperacionesComponent,
    TransaccionesComponent,
    CriptomonedaComponent,
    HomeComponent,
    MovimientosComponent
  
  ],
  imports: [
    CommonModule,
    RouterModule,
    ReactiveFormsModule
  ],
  exports:[
    ServiciosComponent,
    
    RegistroComponent,
    IniciarSesionComponent
  ]
})
export class PagesModule { }
