import { useForm } from "../../../../hooks/useForm";
import Swal from 'sweetalert2';

export const EmpresaPage = () => {

  const {
    codigo,
    nombreLegal,
    cedulaJuridica,
    email,
    telefonoI,
    telefonoII,
    paginaWeb,
    nombreRepresentanteLegal,
    cedulaRepresentanteLegal,
    telefonoRepresentanteLegal,
    emailRepresentanteLegal,

    onInputChange,
    onResetForm
  } = useForm(
    {
      codigo: 'CODEMP0001',
      nombreLegal: 'BalanceMate',
      cedulaJuridica: '123456798',
      email: 'email@email.com',
      telefonoI: '0000-0000',
      telefonoII: '0000-0000',
      paginaWeb: 'www.webpage.com',
      nombreRepresentanteLegal: ' Brendan Eich',
      cedulaRepresentanteLegal: '123456789',
      telefonoRepresentanteLegal: '0000-0000',
      emailRepresentanteLegal: 'email@email.com',
    }
  );

  const onSubmit = (event) => {
    event.preventDefault();
    console.log(
      {
        codigo,
        nombreLegal,
        cedulaJuridica,
        email,
        telefonoI,
        telefonoII,
        paginaWeb,
        nombreRepresentanteLegal,
        cedulaRepresentanteLegal,
        telefonoRepresentanteLegal,
        emailRepresentanteLegal,
      }
    );

    Swal.fire({
      title: 'Confirmación!',
      text: 'Proceso aplicado con éxito',
      icon: 'success',
      confirmButtonText: 'Perfecto'
    });

    onResetForm();
  }

  return (
    <>
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
                id="nombreLegal"
                name="nombreLegal"
                placeholder='Nombre legal'
                autoComplete="off"
                value={nombreLegal}
                onChange={onInputChange}
                required />
            </div>
            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="cedulaJuridica"
                name="cedulaJuridica"
                placeholder='Cédula Juríduca'
                autoComplete="off"
                value={cedulaJuridica}
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
                id="nombreRepresentanteLegal"
                name="nombreRepresentanteLegal"
                placeholder='Representante legal'
                autoComplete="false"
                value={nombreRepresentanteLegal}
                onChange={onInputChange}
                required
              />
            </div>
            <div className="mb-3">
              <input
                type="text"
                className="form-control"
                id="cedulaRepresentanteLegal"
                name="cedulaRepresentanteLegal"
                placeholder='Cédula'
                autoComplete="false"
                value={cedulaRepresentanteLegal}
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
                id="telefonoRepresentanteLegal"
                name="telefonoRepresentanteLegal"
                placeholder='Teléfono'
                autoComplete="false"
                value={telefonoRepresentanteLegal}
                onChange={onInputChange}
                required
              />
            </div>
            <div className="mb-3">
              <input
                type="email"
                className="form-control"
                id="emailRepresentanteLegal"
                name="emailRepresentanteLegal"
                placeholder='Email'
                autoComplete="false"
                value={emailRepresentanteLegal}
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
      </form>
    </>
  )
}
