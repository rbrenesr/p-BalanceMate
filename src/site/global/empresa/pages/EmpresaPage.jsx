import { useEffect } from "react";
import { LoadingSpinner } from "../../../../components/LoadingSpinner";
import { useForm } from "../../../../hooks/useForm";
import { useEmpresaStore } from "../hooks/useEmpresaStore";
import '../styles/EmpresaPage.css'


export const EmpresaPage = () => {

  const { isLoading, empresa, saveEmpresa,  } = useEmpresaStore();


  const {
    id,
    baseDatos,
    nombre,
    cedula,
    correo,
    telefonoUno,
    telefonoDos,
    paginaWeb,
    repNombre,
    repCedula,
    repTelefono,
    repCorreo,

    onInputChange,
    setFormState,
  } = useForm(
    {
      ...empresa      
    }
  );

  const onSubmit = (event) => {
    event.preventDefault(); 
    saveEmpresa(
      {
        id,
        baseDatos,
        nombre,
        cedula,
        correo,
        telefonoUno,
        telefonoDos,
        paginaWeb,
        repNombre,
        repCedula,
        repTelefono,
        repCorreo,
      }
    );

    // location.reload(false);
  }

  return (
    <div className="fade-in">

      <h2 className="mb-3">Empresa</h2>

      <form onSubmit={onSubmit}>
        <div className="row d-flex justify-content-around my-3">
          <div className="col"><h3>Datos</h3></div>
        </div>
        <div className="row d-flex justify-content-around">
          <div className="col-md-4">
            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="baseDatos"
                name="baseDatos"
                placeholder='Código'
                autoComplete="off"
                value={baseDatos}
                onChange={onInputChange}
                required
              />
            </div>
            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="nombre"
                name="nombre"
                placeholder='Nombre legal'
                autoComplete="off"
                value={nombre}
                onChange={onInputChange}
                required />               
            </div>
            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="cedula"
                name="cedula"
                placeholder='Cédula Juríduca'
                autoComplete="off"
                value={cedula}
                onChange={onInputChange}
                required
              />
            </div>
            <div className="mb-3">
              <input
                type="correo"
                className="form-control"
                id="correo"
                name="correo"
                placeholder='Email'
                autoComplete="off"
                value={correo}
                onChange={onInputChange}
                required
              />
            </div>
          </div>
          <div className="col-md-4">
            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="telefonoUno"
                name="telefonoUno"
                placeholder='Teléfono I'
                autoComplete="false"
                value={telefonoUno}
                onChange={onInputChange}
                required
              />
            </div>
            <div className="mb-3">

              <input
                type="text"
                className="form-control"
                id="telefonoDos"
                name="telefonoDos"
                placeholder='Teléfono II'
                autoComplete="false"
                value={telefonoDos}
                onChange={onInputChange}
              />
            </div>

            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="paginaWeb"
                name="paginaWeb"
                placeholder='Página web'
                autoComplete="false"
                value={paginaWeb}
                onChange={onInputChange}
              />
            </div>
          </div>
        </div>
        <div className="row d-flex justify-content-around my-3">
          <div className="col"><h3>Representante Legal</h3></div>
        </div>
        <div className="row d-flex justify-content-around">
          <div className="col-md-4">
            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="repNombre"
                name="repNombre"
                placeholder='Representante legal'
                autoComplete="false"
                value={repNombre}
                onChange={onInputChange}
                required
              />
            </div>
            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="repCedula"
                name="repCedula"
                placeholder='Cédula'
                autoComplete="false"
                value={repCedula}
                onChange={onInputChange}
                required
              />
            </div>
          </div>

          <div className="col-md-4">
            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="repTelefono"
                name="repTelefono"
                placeholder='Teléfono'
                autoComplete="false"
                value={repTelefono}
                onChange={onInputChange}
                required
              />
            </div>
            <div className="mb-3">
              <input
                type="correo"
                className="form-control"
                id="repCorreo"
                name="repCorreo"
                placeholder='Email'
                autoComplete="false"
                value={repCorreo}
                onChange={onInputChange}
                required
              />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col d-flex justify-content-end">
            <button type="submit" className="btn btn-primary">Procesar</button>
          </div>
        </div>
        <br />
        <br />

        {
          isLoading ? <LoadingSpinner /> : '.'
        }

      </form>
    </div>
  )
}
