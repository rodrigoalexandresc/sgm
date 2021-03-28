import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CidadaoIptuRetornoComponent } from './cidadao-iptu-retorno.component';

describe('CidadaoIptuRetornoComponent', () => {
  let component: CidadaoIptuRetornoComponent;
  let fixture: ComponentFixture<CidadaoIptuRetornoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CidadaoIptuRetornoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CidadaoIptuRetornoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
