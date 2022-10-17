import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CriptomonedaComponent } from './pages/criptomoneda/criptomoneda.component';
import { HomeComponent } from './pages/home/home.component';
import { IniciarSesionComponent } from './pages/iniciar-sesion/iniciar-sesion.component';

import { OperacionesComponent } from './pages/operaciones/operaciones.component';
import { Pagina404Component } from './pages/pagina404/pagina404.component';

import { RegistroComponent } from './pages/registro/registro.component';
import { ServiciosComponent } from './pages/servicios/servicios.component';
import { TransaccionesComponent } from './pages/transacciones/transacciones.component';
import { MovimientosComponent } from './pages/movimientos/movimientos.component';

import { AuthGuard } from './services/auth/auth.guard';
import { CotizacionComponent } from './pages/cotizacion/cotizacion.component';
import { PreguntasComponent } from './pages/preguntas/preguntas.component';

const routes: Routes = [
  {path: 'iniciar-sesion', component: IniciarSesionComponent},
  {path:'home', component: HomeComponent, canActivate: [AuthGuard],
  children:[
    {path:'operaciones', component: OperacionesComponent},
    {path:'transacciones', component: TransaccionesComponent},
    {path:'criptomoneda', component: CriptomonedaComponent},
    {path:'movimientos', component: MovimientosComponent},
  ]},
  {path:'servicios', component: ServiciosComponent},
  {path: 'cotizacion', component: CotizacionComponent},
  {path: 'preguntas', component: PreguntasComponent},
  
  
  {path: 'registro', component:RegistroComponent},
  {path: '', redirectTo: '/servicios', pathMatch: 'full'},

  {path: '**', component: Pagina404Component},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { 
 
}


