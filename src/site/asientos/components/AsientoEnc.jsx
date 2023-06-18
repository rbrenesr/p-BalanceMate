import React from 'react';
import DatePicker, { registerLocale } from 'react-datepicker';
import es from 'date-fns/locale/es';
registerLocale('es', es) //*Idioma en español
import "react-datepicker/dist/react-datepicker.css";
import { useForm } from "../.././../hooks";
import { TiposDeAsiento, TotalAsiento } from './';

export const AsientoEnc = () => {
  const {
    tipoDeAsiento,
    fecha,
    concepto,

    onInputChange,
    onDateChanged,
  
  } = useForm(
    {
      tipoDeAsiento: "",
      fecha: new Date(),
      concepto: "",
    }
  );


  return (
    <>
      <form>
        <div className="row d-flex flex-md-row-reverse">
          <div className="col-md-6">
            <TotalAsiento />
          </div>
          <div className="col-md-6">
            <div className="row d-flex justify-content-around">
              <div className="col-md-6">
                <div className="mb-3">
                  <TiposDeAsiento tipoDeAsiento={tipoDeAsiento} onInputChange={onInputChange} />
                </div>
              </div>
              <div className="col-md-6">
                <div className="mb-3">
                  <div className="form-group mb-2">
                    <DatePicker
                      id='fecha'
                      selected={fecha}
                      onChange={(event) => onDateChanged(event, 'fecha')}
                      className="form-control"
                      locale="es"
                      timeCaption="Hora"
                    />
                  </div>
                </div>
              </div>
            </div>
            <div className="row">
              <div className="col-md-12">
                <div className="mb-3">
                  <textarea
                    type="text"
                    className="form-control"
                    id="concepto"
                    placeholder="Concepto"
                    rows="2"
                    name="concepto"                                        
                    autoComplete="off"
                    value={concepto}
                    onChange={onInputChange}
                                                        
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
    </>
  )
}
