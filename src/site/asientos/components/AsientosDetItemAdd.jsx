import Swal from "sweetalert2";
import { useForm } from "../../../hooks/useForm";
import { useAsientosStore } from "../hooks/useAsientosStore";
import { useEffect } from "react";

export const AsientosDetItemAdd = () => {

  const onFormSubmit = () => {event.preventDefault();}
  const { asientosDetItemsActiveId, asientosDetItemSelected, newAsientoDetItem, } = useAsientosStore();

  useEffect(() => {     
     setFormState(asientosDetItemSelected);
  }, [asientosDetItemsActiveId])


  const {
    cuenta,
    debe,
    descripcion,
    haber,
    id,
    nDocumento,
    observaciones,
    tDocumento,
    tercero,

    formState,
    onInputChange,
    onNumericInputChange,
    onNumericInputOnblur,
    onResetForm,
    onSelectChange,
    setFormState,
  } = useForm(
    asientosDetItemSelected
  );



  const onAddlinea = () => {

    newAsientoDetItem({
      cuenta,
      descripcion,
      observaciones,
      tDocumento,
      nDocumento,
      tercero,
      debe,
      haber,
    });

    document.getElementById("cuenta").focus();
    document.getElementById("cuenta").select();    
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
            <input
              type="hidden"
              className="form-control"
              id="descripcion"
              name="descripcion"
              value={descripcion}
              onChange={onInputChange}
            />
          </div>

          <div className="col-md-2">
            <input
              type="text"
              className="form-control"
              id="observaciones"
              name="observaciones"
              placeholder="observaciones"
              value={observaciones}
              onChange={onInputChange}
            />
          </div>

          <div className="col">
            <select
              className="form-select"
              aria-label="Tipos de documento"
              id="tDocumento"
              name="tDocumento"
              // defaultValue={tipoDeAsiento}
              value={tDocumento}
              onChange={onInputChange}
            // onChange={onSelectChange}
            >

              <option key="k0" value="NON">Seleccione</option>
              <option key="k1" value="APE">APERTURA</option>
              <option key="k2" value="CHE">CHEQUE</option>
              <option key="k3" value="DEP">DEPÓSITO</option>
              <option key="k4" value="FAC">FACTURA</option>

            </select>
          </div>

          <div className="col">
            <input
              type="text"
              className="form-control"
              id="nDocumento"
              name="nDocumento"
              placeholder="N Doc"
              value={nDocumento}
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


