import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { CuentaService } from 'src/app/services/cuenta.service';
import { ComprarDto } from '../servicios/dtos/ComprarDto';
import { SaldoDto } from '../servicios/dtos/SaldoDto';
import { TransaccionService } from '../servicios/transaccion.service';

@Component({
  selector: 'app-movimientos',
  templateUrl: './movimientos.component.html',
  styleUrls: ['./movimientos.component.css']
})
export class MovimientosComponent implements OnInit {

  usuarioSaldo = "Saldo Bitcoin:0.00034/Ethereum:0.0050/Monero:0.045"; //

  hoy = new Date();
  mostrarMovimientos: boolean = true;
  movimientos: any;
  constructor(
    private transaccion: TransaccionService,
    cuenta: CuentaService) {
    this.movimientos = cuenta.ObtenerUltimosMovimientos();
  }

  ngOnInit(): void {
  }

  //////////////////////////////////////////////////////////////////////////////////////
  compraDto?: ComprarDto;
  onComprarEthereum() {
    console.log(" ")
    console.log("[*] (movimientos) Comprando $200.000 en Ethereum");

    this.compraDto = new ComprarDto("9", "11", "200000");

    this.transaccion.comprarEthereum(this.compraDto).subscribe({
      next: data => {
        console.log("[*]  Response devuelto por el BE:" );
        console.log("     SaldoCuentaDebito: " + data.SaldoCuentaDebito);
        console.log("     SaldoCuentaCredito: " + data.SaldoCuentaCredito);
        console.log("     ImporteCompradoEnTipoMoneda: " + data.ImporteCompradoEnTipoMoneda);
        console.log("     SaldoCuentaDebiFechaTransaccionto: " + data.FechaTransaccion);
      },
      error: err => {
        console.log("[*] La transaccion no se pudo realizar.");
      }
    });
  }

  async onGetSaldoPesos() {
    console.log(" ");
    console.log("[*] Getting Saldo en Cuenta Pesos:");
    this.transaccion.getSaldoPesos("9").subscribe({
      next: data => {
        console.log("     Saldo: " + data.Saldo);
      },
      error: err => {
        console.log("[*] La transaccion no se pudo realizar.");
      }
    });
  }

  saldoDto?: SaldoDto;
  async onGetSaldoPesosDto() {
    console.log(" ");
    console.log("[*] Getting Saldo en Cuenta Pesos:");

    this.saldoDto = new SaldoDto("9");

    this.transaccion.getSaldoPesosDto(this.saldoDto).subscribe({
      next: data => {
        console.log("     Saldo: " + data.Saldo);
      },
      error: err => {
        console.log("[*] La transaccion no se pudo realizar.");
      }
    });
  }

  async onGetBilleteraEthereum() {
    console.log(" ");
    console.log("[*] Getting Billetera Ethereum:");
    this.transaccion.getBilleteraEthereum("11").subscribe({
      next: data => {
        console.log("[*]  Response devuelto por el BE:");
 
        console.log("     ID_Billetera: " + data.ID_Billetera);
        console.log("     ID_TipoMoneda: " + data.ID_TipoMoneda);
        console.log("     ID_Usuario: " + data.ID_Usuario);
        console.log("     SaldoCliente: " + data.SaldoCliente);
        console.log("     FechaAltaCuentaUsuario: " + data.FechaAltaCuentaUsuario);
        console.log("     FechaBajaCuentaUsuario: " + data.FechaBajaCuentaUsuario);

      },
      error: err => {
        console.log("[*] La transaccion no se pudo realizar.");
      }
    });

  }

  //////////////////////////////////////////////////////////////////////////////////////

}

