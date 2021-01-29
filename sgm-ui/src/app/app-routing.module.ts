import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { CidadaoIptuComponent } from "./cidadao-iptu/cidadao-iptu.component";

const routes: Routes = [
    { path: 'cidadao/iptu', component: CidadaoIptuComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
