import { useEffect } from "react";
import { LoadingSpinner } from "../../../../components/LoadingSpinner";
import { useForm } from "../../../../hooks/useForm";
import { useEmpresaStore } from "../hooks/useEmpresaStore";
import '../styles/EmpresaPage.css'


export const EmpresaPage = () => {

  const { isLoading, empresa, selectEmpresa, saveEmpresa,  } = useEmpresaStore();

  useEffect(() => {    
    selectEmpresa();      
  }, [])
  

  //...formState,
  // formState,
  //setFormState,

  const {
    id,
    codigo,
    nombre,
    cedula,
    email,
    telefonoI,
    telefonoII,
    paginaWeb,
    repLegalNombre,
    repLegalCedula,
    repLegalTelefono,
    repLegalEmail,

    onInputChange,
    setFormState,
  } = useForm(
    {
      ...empresa
    }
  );

  const onSubmit = (event) => {
    event.preventDefault();
    console.log(
      {
        id,
        codigo,
        nombre,
        cedula,
        email,
        telefonoI,
        telefonoII,
        paginaWeb,
        repLegalNombre,
        repLegalCedula,
        repLegalTelefono,
        repLegalEmail,
      }
    );

    saveEmpresa(
      {
        id,
        codigo,
        nombre,
        cedula,
        email,
        telefonoI,
        telefonoII,
        paginaWeb,
        repLegalNombre,
        repLegalCedula,
        repLegalTelefono,
        repLegalEmail,
      }
    );
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
                id="codigo"
                name="codigo"
                placeholder='Código'
                autoComplete="off"
                value={codigo}
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
                type="email"
                className="form-control"
                id="email"
                name="email"
                placeholder='Email'
                autoComplete="off"
                value={email}
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
                id="telefonoI"
                name="telefonoI"
                placeholder='Teléfono I'
                autoComplete="false"
                value={telefonoI}
                onChange={onInputChange}
                required
              />
            </div>
            <div className="mb-3">

              <input
                type="text"
                className="form-control"
                id="telefonoII"
                name="telefonoII"
                placeholder='Teléfono II'
                autoComplete="false"
                value={telefonoII}
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
                id="repLegalNombre"
                name="repLegalNombre"
                placeholder='Representante legal'
                autoComplete="false"
                value={repLegalNombre}
                onChange={onInputChange}
                required
              />
            </div>
            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="repLegalCedula"
                name="repLegalCedula"
                placeholder='Cédula'
                autoComplete="false"
                value={repLegalCedula}
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
                id="repLegalTelefono"
                name="repLegalTelefono"
                placeholder='Teléfono'
                autoComplete="false"
                value={repLegalTelefono}
                onChange={onInputChange}
                required
              />
            </div>
            <div className="mb-3">
              <input
                type="email"
                className="form-control"
                id="repLegalEmail"
                name="repLegalEmail"
                placeholder='Email'
                autoComplete="false"
                value={repLegalEmail}
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
