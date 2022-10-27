import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ComprarDto } from './dtos/ComprarDto';
import { SaldoDto } from './dtos/SaldoDto';


const AUTH_API = 'https://localhost:44375/api/';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
}; 

@Injectable({
  providedIn: 'root'
})

export class TransaccionService {

  constructor(private http: HttpClient) { }

  comprarEthereum(dto: ComprarDto): Observable<any> {
    console.log('[*] (transaccion) comprarEthereum().');
    return this.http.post( AUTH_API + 'transaccion/comprar', dto, httpOptions);
  }

  getSaldoPesos(cta: string): Observable<any> {
    console.log('[*] (transaccion) getSaldoPesos().');
    return this.http.get<any>(AUTH_API + 'transaccion/saldoctapesos/' + cta);
  }

  getSaldoPesosDto(dto: SaldoDto): Observable<any> {
    console.log('[*] (transaccion) getSaldoPesos().');
    return this.http.get<any>(AUTH_API + 'transaccion/saldoctapesos' , httpOptions);
  }
  
  getBilleteraEthereum(cta: string): Observable<any> {
    console.log('[*] (transaccion) getBilleteraEthereum().');
    return this.http.get<any>(AUTH_API + 'billeteras/getcuenta/' + cta);
  }
}
