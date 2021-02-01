import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cidadao-iptu',
  templateUrl: './cidadao-iptu.component.html',
  styleUrls: ['./cidadao-iptu.component.scss']
})
export class CidadaoIptuComponent implements OnInit {

  formConsulta: FormGroup;

  constructor(private fb: FormBuilder, private router: Router) { }  

  ngOnInit(): void {
    this.formConsulta = this.fb.group({
      CPFouCNPJ: ['', Validators.required],
      Inscricao: ['', Validators.required],
      DataConsulta: [new Date(), Validators.required]
    })
  }

  onSubmit() {
    console.log(`${JSON.stringify( this.formConsulta.value)}`);
    this.router.navigate(['/cidadao/iptu/retorno']);    
  }

}
