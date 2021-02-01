import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { CidadaoIptuRetornoComponent } from "./cidadao-iptu-retorno/cidadao-iptu-retorno.component";
import { CidadaoIptuComponent } from "./cidadao-iptu/cidadao-iptu.component";

const routes: Routes = [
    { path: 'cidadao/iptu', component: CidadaoIptuComponent },
    { path: 'cidadao/iptu/retorno', component: CidadaoIptuRetornoComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
