import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { environment } from "src/environments/environment";

@Injectable()
export class MapaService {

    /**
     *
     */
    constructor(private httpClient: HttpClient) {        
    }

    obterCatalogo() : Observable<any> {
        return this.httpClient.get<any>(`${environment.apigeo}/mapa/catalogo`);
    }

    obterImagem(id: number): Observable<any> {
        return this.httpClient.get<any>(`${environment.apigeo}/mapa/imagem/${id}`);
      }
}