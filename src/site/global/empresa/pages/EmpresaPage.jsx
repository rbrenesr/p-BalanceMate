export const EmpresaPage = () => {
  return (

    <>
      <h2 className="mb-5">Empresa</h2>
      <form>

        <div className="row d-flex justify-content-around my-3">
          <div className="col"><h3>Datos</h3></div>
        </div>
        <div className="row d-flex justify-content-around">
          <div className="col-md-4">
            <div className="mb-3">              
              <input type="text" className="form-control" id="codigo" name="codigo" placeholder='Código' required />
            </div>
            <div className="mb-3">              
              <input type="text" className="form-control" id="nombreLegal" name="nombreLegal" placeholder='Nombre legal' required />
            </div>
            <div className="mb-3">              
              <input type="text" className="form-control" id="cedulaJuridica" name="cedulaJuridica" placeholder='Cédula Juríduca' required />
            </div>
            <div className="mb-3">              
              <input type="email" className="form-control" id="correo" name="correo" placeholder='Email' required />
            </div>
          </div>
          <div className="col-md-4">
            <div className="mb-3">              
              <input type="text" className="form-control" id="telefonoUno" name="telefonoUno" placeholder='Teléfono I' required />
            </div>
            <div className="mb-3">              
              <input type="text" className="form-control" id="telefonoDos" name="telefonoDos" placeholder='Teléfono II' />
            </div>

            <div className="mb-3">              
              <input type="text" className="form-control" id="paginaWeb" name="paginaWeb" placeholder='Página web' />
            </div>
          </div>
        </div>
        <div className="row d-flex justify-content-around my-3">
          <div className="col"><h3>Representante Legal</h3></div>
        </div>
        <div className="row d-flex justify-content-around">
          <div className="col-md-4">
            <div className="mb-3">              
              <input type="text" className="form-control" id="representanteLegal" name="representanteLegal" placeholder='Representante legal' required />
            </div>
            <div className="mb-3">              
              <input type="text" className="form-control" id="cedula" name="cedula" placeholder='Cédula' required />
            </div>
          </div>

          <div className="col-md-4">
            <div className="mb-3">              
              <input type="text" className="form-control" id="telefonoUnoRepLeg" name="telefonoUnoRepLeg" placeholder='Teléfono' required />
            </div>
            <div className="mb-3">              
              <input type="email" className="form-control" id="correoRepLeg" name="correoRepLeg" placeholder='Email' required />
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
