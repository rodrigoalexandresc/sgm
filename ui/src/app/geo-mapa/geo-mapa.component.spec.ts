import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GeoMapaComponent } from './geo-mapa.component';

describe('GeoMapaComponent', () => {
  let component: GeoMapaComponent;
  let fixture: ComponentFixture<GeoMapaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GeoMapaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GeoMapaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
