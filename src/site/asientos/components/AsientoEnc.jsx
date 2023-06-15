import React from 'react';
import { useForm } from "../.././../hooks";
import { TiposDeAsiento } from './';
import DatePicker, { registerLocale } from 'react-datepicker';
import "react-datepicker/dist/react-datepicker.css";
import es from 'date-fns/locale/es';
registerLocale('es', es) //*Idioma en español



export const AsientoEnc = () => {
  const {
    tipoDeAsiento,
    fecha,
    concepto,

    onInputChange,
    onDateChanged,
    onResetForm
  } = useForm(
    {
      tipoDeAsiento: "",
      fecha: new Date(),
      concepto: "",
    }
  );

  const onFormSubmit = (event) => {
    event.preventDefault();
    const nuevaCuenta = {
      id: new Date().getTime(),
      cuentaMadre: cuentaMadre,
      cuenta: cuenta,
      tipo: tipo,
      descripcion: descripcion,
      descripcionUso: descripcionUso,
    };

    onNewCuenta(nuevaCuenta);
    Swal.fire('', 'Cuenta contable ingresada con éxito', '');
  }




  return (
    <>
      <form onSubmit={onFormSubmit}>

        <div className="row d-flex justify-content-around">
          <div className="col-md-3">
            <div className="mb-3">
              <TiposDeAsiento tipoDeAsiento={tipoDeAsiento} onInputChange={onInputChange}/>
            </div>
          </div>
          <div className="col-md-3">
            <div className="mb-3">
              <div className="form-group mb-2">
                <DatePicker
                  selected={fecha}
                  onChange={(event) => onDateChanged(event, 'fecha')}
                  className="form-control"
                  locale="es"
                  timeCaption="Hora"
                />
              </div>
            </div>
          </div>
          <div className="col-md-6 totales">
            <div className="mb-3">
            </div>
          </div>
        </div>

        <div className="row">
          <div className="col-md-6">
            <div className="mb-3">
              <textarea
                type="text"
                className="form-control"
                id="concepto"
                placeholder="Concepto"
                rows="2"
                name="concepto"
              />

            </div>
          </div>
          <div className="col-md-6 totales">

          </div>
        </div>

      </form>
    </>
  )
}
