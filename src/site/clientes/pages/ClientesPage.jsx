import {ClientesModal} from '../components/ClientesModal';


export const ClientesPage = () => {
  return (
    <>

<ClientesModal/>
      <h2 className="mb-3">Clientes</h2>
      <form>

        <div className="row d-flex justify-content-around my-3">
          <div className="col"><h3>Datos</h3></div>
        </div>


        <div className="row d-flex justify-content-around">
          <div className="col-md-3">
            <div className="mb-3">
              <input type="text" className="form-control" id="cedula" name="cedula" placeholder='Cédula - ID' required />
            </div>
          </div>
          <div className="col-md-3">
            <div className="mb-3">
              <input type="text" className="form-control" id="nombre" name="nombre" placeholder='Nombre' required />
            </div>
          </div>
          <div className="col-md-3">
            <div className="mb-3">
              <input type="email" className="form-control" id="correo" name="correo" placeholder='Email' required />
            </div>
          </div>
          <div className="col-md-3">
            <div className="mb-3">
              <input type="text" className="form-control" id="telefono" name="telefono" placeholder='Teléfono' required />
            </div>
          </div>
        </div>

        <div className="row d-flex justify-content-around">
          <div className="col-md-5">
            <div className="mb-3">
              <input type="text" className="form-control" id="direccion" name="direccion" placeholder='Dirección' />
            </div>
          </div>
          <div className="col-md-5">
            <div className="mb-3">
              <input type="text" className="form-control" id="notas" name="notas" placeholder='Notas' />
            </div>
          </div>
          <div className="col-md-2">
            <div className="col d-flex justify-content-end">
              <button type="submit" className="btn btn-primary">Procesar</button>
            </div>
          </div>
        </div>

        <br />
        <br />
      </form >
    </>
  )
}
