import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CuentaService {

  constructor() { }

  ObtenerUltimosMovimientos()
  {
   
  return [{operacion:"compra",monto:0.0010,moneda:"ethereum"}, 
          {operacion:"compra", monto:0.015,moneda:"monero"},
          {operacion:"compra", monto:0.00004,moneda:"bitcoin"},
          {operacion:"conversion", monto:0.00011,moneda:"bitcoin"}]; 
  }
}
