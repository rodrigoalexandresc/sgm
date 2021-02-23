import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { environment } from "src/environments/environment";

@Injectable()
export class LoteService {
    /**
     *
     */
    constructor(private httpClient: HttpClient) {        
    }

    obter(loteConsulta: any) : Observable<any> {
        return this.httpClient.post<any>(`${environment.apigeo}/lote/consulta`, loteConsulta);
    }
}