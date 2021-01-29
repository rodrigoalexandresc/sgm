import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CidadaoIptuComponent } from './cidadao-iptu.component';

describe('CidadaoIptuComponent', () => {
  let component: CidadaoIptuComponent;
  let fixture: ComponentFixture<CidadaoIptuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CidadaoIptuComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CidadaoIptuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
