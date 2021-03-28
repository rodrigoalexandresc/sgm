import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GeoLoteComponent } from './geo-lote.component';

describe('GeoLoteComponent', () => {
  let component: GeoLoteComponent;
  let fixture: ComponentFixture<GeoLoteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GeoLoteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GeoLoteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
