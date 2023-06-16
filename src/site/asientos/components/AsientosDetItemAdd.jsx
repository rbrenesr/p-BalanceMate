import Swal from "sweetalert2";
import { useForm } from "../../../hooks/useForm";

export const AsientosDetItemAdd = () => {

  const onFormSubmit = () => {
    event.preventDefault();
    console.log('formsubmit...');
  }

  const {
    cuenta,
    nota,
    tipoDeAsiento,
    numeroDocumento,
    tercero,
    debe,
    haber,
    onInputChange,
    onNumericInputChange,
    onNumericInputOnblur
  } = useForm({
    cuenta: '',
    nota: '',
    tipoDeAsiento: '',
    numeroDocumento: '',
    tercero: '',
    debe: '0.00',
    haber: '0.00',
  });
  

  const onAddlinea = () => {
    console.log(
      {
        cuenta,
        nota,
        tipoDeAsiento,
        numeroDocumento,
        tercero,
        debe,
        haber,        
      }
    );
  }

  return (
    <>
      <form onSubmit={onFormSubmit}>
        <div className="row d-flex justify-content-around">

          <div className="col-md-2 d-flex sm">
            <input
              type="text"
              className="form-control"
              id="cuenta"
              name="cuenta"
              placeholder="Cuenta"
              value={cuenta}
              onChange={onInputChange}
            />
            <button className="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
              </svg>
            </button>
          </div>

          <div className="col-md-2">
            <input
              type="text"
              className="form-control"
              id="nota"
              name="nota"
              placeholder="Nota"
              value={nota}
              onChange={onInputChange}
            />
          </div>

          <div className="col">
            <select
              className="form-select"
              aria-label="Tipos de Asiento"
              id="tipoDeAsiento"
              name="tipoDeAsiento"
              defaultValue={tipoDeAsiento}
              onChange={onInputChange}
            >

              <option key="1" value="1">APERTURA</option>
              <option key="2" value="1">CHEQUE</option>
              <option key="3" value="1">DEPÓSITO</option>
              <option key="4" value="1">FACTURA</option>

            </select>
          </div>

          <div className="col">
            <input
              type="text"
              className="form-control"
              id="numeroDocumento"
              name="numeroDocumento"
              placeholder="Numero Documento"
              value={numeroDocumento}
              onChange={onInputChange}
            />
          </div>


          <div className="col d-flex">
            <input
              type="text"
              className="form-control"
              id="tercero"
              name="tercero"
              placeholder="Tercero"
              value={tercero}
              onChange={onInputChange}
            />
            <button className="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
              </svg>
            </button>
          </div>

          <div className="col">
            <input
              type="text"
              className="form-control"
              id="debe"
              name="debe"
              placeholder="Debe"
              value={debe}
              onChange={onNumericInputChange}
              onBlur={onNumericInputOnblur}
            />
          </div>

          <div className="col">
            <input
              type="text"
              className="form-control"
              id="haber"
              name="haber"
              placeholder="Haber"
              value={haber}
              onChange={onNumericInputChange}
              onBlur={onNumericInputOnblur}
            />
          </div>

          <div className="col">
            <button type="submit" className="btn btn-primary" onClick={onAddlinea}>+</button>
          </div>





        </div>

      </form>
    </>
  )
}


