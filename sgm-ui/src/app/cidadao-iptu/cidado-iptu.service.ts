import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { environment } from "src/environments/environment";

@Injectable({
    providedIn: 'root',
})
export class IPTUService {
    /**
     *
     */
    constructor(private httpClient: HttpClient) {        
    }

    obter(iptuConsulta: any) : Observable<any> {
        return this.httpClient.post<any>(`${environment.api}/imposto/consulta`, iptuConsulta);
    }
}