import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Observable, Subject } from 'rxjs';
import { IPTUService } from './cidado-iptu.service';

@Component({
  selector: 'app-cidadao-iptu',
  templateUrl: './cidadao-iptu.component.html',
  styleUrls: ['./cidadao-iptu.component.scss'],
  providers: [IPTUService]
})
export class CidadaoIptuComponent implements OnInit {

  formConsulta: FormGroup;
  iptus$: Observable<any>;

  constructor(private fb: FormBuilder, private router: Router, private iptuService: IPTUService ) { }  

  ngOnInit(): void {
    this.formConsulta = this.fb.group({
      CPFouCNPJ: ['', Validators.required],
      InscricaoImovel: ['', Validators.required],
      DataConsulta: [new Date(), Validators.required]
    })
  }

  onSubmit() {
    const formData = this.formConsulta.value;
    this.iptus$ = this.iptuService.obter(formData);
    // console.log(`${JSON.stringify( this.formConsulta.value)}`);    
    // this.router.navigate(['/cidadao/iptu/retorno']);    
  }

}
