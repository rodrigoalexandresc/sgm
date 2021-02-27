import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { CidadaoIptuRetornoComponent } from "./cidadao-iptu-retorno/cidadao-iptu-retorno.component";
import { CidadaoIptuComponent } from "./cidadao-iptu/cidadao-iptu.component";
import { GeoLoteComponent } from "./geo-lote/geo-lote.component";
import { GeoMapaComponent } from "./geo-mapa/geo-mapa.component";

const routes: Routes = [
    { path: 'cidadao/iptu', component: CidadaoIptuComponent },
    { path: 'cidadao/iptu/retorno', component: CidadaoIptuRetornoComponent },
    { path: 'geo/lote', component: GeoLoteComponent },
    { path: 'geo/mapa', component: GeoMapaComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
