import { Component, OnInit } from '@angular/core';
import { CuentaService } from 'src/app/services/cuenta.service';

@Component({
  selector: 'app-movimientos',
  templateUrl: './movimientos.component.html',
  styleUrls: ['./movimientos.component.css']
})
export class MovimientosComponent implements OnInit {

  usuarioSaldo="Saldo Bitcoin:0.00034/Ethereum:0.0050/Monero:0.045"; //

  hoy= new Date();
  mostrarMovimientos: boolean=true;
  movimientos:any;
  constructor( cuenta: CuentaService) 
  {
     this.movimientos=cuenta.ObtenerUltimosMovimientos();
  }

  ngOnInit(): void {
  }

}
