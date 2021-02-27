import { FlatTreeControl } from '@angular/cdk/tree';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTreeFlatDataSource, MatTreeFlattener } from '@angular/material/tree';
import { DomSanitizer } from '@angular/platform-browser';
import { MapaService } from './geo-mapa.service';

interface FlatNode {
  expandable: boolean;
  name: string;
  id: number;
  level: number;
}

interface Mapa {
  Titulo: string,
  MapaId: number,
  Filhos: Mapa[]
}

@Component({
  selector: 'app-geo-mapa',
  templateUrl: './geo-mapa.component.html',
  styleUrls: ['./geo-mapa.component.scss'],
  providers: [MapaService]
})
export class GeoMapaComponent implements OnInit {
  @ViewChild("imagemMapa") imagemMapa: HTMLImageElement;

  private _transformer = (node: Mapa, level: number) => {
    return {
      expandable: !!node.Filhos && node.Filhos.length > 0,
      name: node.Titulo,
      level: level,
      id: node.MapaId
    };
  }

  treeControl = new FlatTreeControl<FlatNode>(
    node => node.level, node => node.expandable);

    treeFlattener = new MatTreeFlattener(
      this._transformer, node => node.level, node => node.expandable, node => node.Filhos);

  dataSource = new MatTreeFlatDataSource(this.treeControl, this.treeFlattener);    

  constructor(private mapaService: MapaService, private _sanitizer: DomSanitizer) {
  }

  hasChild = (_: number, node: FlatNode) => node.expandable;

  ngOnInit(): void {
    this.mapaService.obterCatalogo().subscribe(d => {
      this.dataSource.data = d;
    })
  }

  exibirImagem: boolean = false;
  imagePath: any;
  imageWidth: number= 0;
  imageTitle: string ="";

  exibirImagemMapa(id: number, name: string) {
    this.mapaService.obterImagem(id).subscribe(data => {
      this.imageWidth = this.calcularImageWidth();
      const linkImagem = `data:image/jpg;base64,${data}`;
      this.imagePath = this._sanitizer.bypassSecurityTrustResourceUrl(linkImagem);
      this.imageTitle = name;    
      this.exibirImagem = true;
    })
  }

  fecharImagem() {
    this.exibirImagem = false;
    this.imagePath = null;
    this.imageTitle = "";
  }

  calcularImageWidth = () => window.innerWidth * 0.9;
}


