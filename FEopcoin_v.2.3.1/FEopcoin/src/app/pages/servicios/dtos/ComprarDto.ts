export class ComprarDto {

    CuentaDebito: string = '';
    CuentaCredito: string = '';
    Importe: string = '';

    constructor(CuentaDebito: string, CuentaCredito: string, Importe: string) {
        this.CuentaDebito = CuentaDebito;
        this.CuentaCredito = CuentaCredito;
        this.Importe = Importe;
    }
}
