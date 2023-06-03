

export const ProveedoresPage = () => {
  return (
    <div style={{ maxHeight: '650px', overflowY: 'auto' }}>
      <div className="container mt-5">
        <form>
          <h2 className="mb-5">Proveedores</h2>
          <div className="row">
            <div className="col-md-6">
              <h3>Datos</h3>
              <div className="mb-3">
                <label htmlFor="codigo" className="form-label">Código:</label>
                <input type="text" className="form-control" id="codigo" name="codigo" required />
              </div>
              <div className="mb-3">
                <label htmlFor="nombreLegal" className="form-label">Nombre Legal:</label>
                <input type="text" className="form-control" id="nombreLegal" name="nombreLegal" required />
              </div>
              <div className="mb-3">
                <label htmlFor="cedulaJuridica" className="form-label">Cédula Jurídica:</label>
                <input type="text" className="form-control" id="cedulaJuridica" name="cedulaJuridica" required />
              </div>
              <div className="mb-3">
                <label htmlFor="telefonoUno" className="form-label">Teléfono:</label>
                <input type="text" className="form-control" id="telefonoUno" name="telefonoUno" required />
              </div>
              <div className="mb-3">
                <label htmlFor="telefonoDos" className="form-label">Teléfono:</label>
                <input type="text" className="form-control" id="telefonoDos" name="telefonoDos" />
              </div>
              <div className="mb-3">
                <label htmlFor="correo" className="form-label">Correo Electrónico:</label>
                <input type="email" className="form-control" id="correo" name="correo" required />
              </div>
              <div className="mb-3">
                <label htmlFor="paginaWeb" className="form-label">Página Web:</label>
                <input type="text" className="form-control" id="paginaWeb" name="paginaWeb" />
              </div>
            </div>

            <div className="col-md-6">
              <h3>Representante Legal</h3>
              <div className="mb-3">
                <label htmlFor="representanteLegal" className="form-label">Nombre:</label>
                <input type="text" className="form-control" id="representanteLegal" name="representanteLegal" required />
              </div>
              <div className="mb-3">
                <label htmlFor="cedula" className="form-label">Cédula:</label>
                <input type="text" className="form-control" id="cedula" name="cedula" required />
              </div>
              <div className="mb-3">
                <label htmlFor="telefonoUnoRepLeg" className="form-label">Teléfono:</label>
                <input type="text" className="form-control" id="telefonoUnoRepLeg" name="telefonoUnoRepLeg" required />
              </div>
              <div className="mb-3">
                <label htmlFor="correoRepLeg" className="form-label">Correo Electrónico:</label>
                <input type="email" className="form-control" id="correoRepLeg" name="correoRepLeg" required />
              </div>
              <button type="submit" className="btn btn-primary">Enviar</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  )
}
