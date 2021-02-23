import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { LoteService } from './lote.service';

@Component({
  selector: 'app-geo-lote',
  templateUrl: './geo-lote.component.html',
  styleUrls: ['./geo-lote.component.scss'],
  providers: [LoteService]
})
export class GeoLoteComponent implements OnInit {

  formConsulta: FormGroup;
  lotes$: Observable<any>;

  constructor(private fb: FormBuilder, private router: Router, private loteService: LoteService ) { }  

  ngOnInit(): void {
    this.formConsulta = this.fb.group({
      Endereco: ['', Validators.required],
      InscricaoImovel: ['', Validators.required],
      GeoId: [null, Validators.required]
    })
  }

  onSubmit() {
    const formData = this.formConsulta.value;
    this.lotes$ = this.loteService.obter(formData);
    // console.log(`${JSON.stringify( this.formConsulta.value)}`);    
    // this.router.navigate(['/cidadao/iptu/retorno']);    
  }

}
