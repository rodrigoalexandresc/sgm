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

  idLoteEmAtualizacao: number;

  formConsulta: FormGroup;
  lotes$: Observable<any>;

  formLoteAtualizar: FormGroup;
  exibeLoteAtualizar: boolean = false;

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

  atualizar(loteId: number) {
    this.loteService.obterDadosAtualizar(loteId).subscribe(data => this.criarFormAtualizar(data))
  }

  criarFormAtualizar(data: any) {
    this.idLoteEmAtualizacao = data.Id;
    this.formLoteAtualizar = this.fb.group({
      Id: [data.Id, Validators.required], 
      LoteId: [data.LoteId, Validators.required],
      AreaConstruida: [data.AreaConstruida, Validators.required],
      AreaTerreno: [data.AreaTerreno, Validators.required]
    });

    this.exibeLoteAtualizar = true;
  }

  onSubmitLoteAtualizar() {
    if (!this.formLoteAtualizar.valid) return;
    const loteHistorico = this.formLoteAtualizar.value;
    this.loteService.salvarDadosLote(loteHistorico).subscribe(data => {
      this.fecharFormAtualizacao();
    })
  }

  fecharFormAtualizacao() {
    this.formLoteAtualizar = null;
    this.exibeLoteAtualizar = false;
  }

}
