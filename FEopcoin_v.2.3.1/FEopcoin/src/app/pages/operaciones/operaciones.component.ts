import { Component, OnInit } from '@angular/core';

export class Opera {

  constructor(
    public id: number,
    public name: string,
    public power: string,
    public alterEgo?: string
  ) {  }

}

@Component({
  selector: 'app-operaciones',
  templateUrl: './operaciones.component.html',
  styleUrls: ['./operaciones.component.css']
})
export class OperacionesComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  moneda = ['Bitcoin', 'Ethereum',
            'Monero', 'Cardano'];

  formaPago = ['Paypal', 'Rapipago',
            'Naranja', 'Bancor'];


  tipoBilletera = ['BTC 3EEEjkUF6uxgjSukkjVtfKNnrdfrebRGR7', 'ETH kjVtfKNnrdfrebRGR73EEEjkUF6uxgjSuk',
            'XMR NnrdfrebRGR73EEEkjVtfKjkUF6uxgjSuk', 'ADA UF6uxgjSukNnrdfrebRGR73EEEkjVtfKjk'];

  model = new Opera(18, 'Dr IQ', this.moneda[0], 'Chuck Overstreet');

  submitted = false;

  onSubmit() { this.submitted = true; }

  
  get diagnostic() { return JSON.stringify(this.model); }

  nuevaOper() {
    this.model = new Opera(42, '', '');
  }

  skyDog(): Opera {
    let miOper =  new Opera(42, 'SkyDog',
                           'Fetch any object at any distance',
                           'Leslie Rollover');
    console.log('Mi operacion es ' + miOper.name); 
    return miOper;
  }

  
  showFormControls(form: any) {
    return form && form.controls['name'] &&
    form.controls['name'].value; // Dr. IQ
  }


}






