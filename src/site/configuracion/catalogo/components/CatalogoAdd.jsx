
export const CatalogoAdd = () => {
    return (
        <>
            <form>

                <div className="row d-flex justify-content-around my-3">
                    <div className="col"><h5>Nueva cuenta</h5></div>
                </div>

                <div className="row d-flex justify-content-around">
                    <div className="col-md-2">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="cuentaMadre" name="cuentaMadre" placeholder='Cuenta madre' required />
                        </div>
                    </div>
                    <div className="col-md-2">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="cuenta" name="cuenta" placeholder='Cuenta' required />
                        </div>
                    </div>
                    <div className="col-md-2">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="tipoCuenta" name="tipoCuenta" placeholder='Tipo cuenta' required />
                        </div>
                    </div>
                    <div className="col-md-6">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="descripcion" name="descripcion" placeholder='Descripción' />
                        </div>
                    </div>
                </div>

                <div className="row">
                    <div className="col-md-6">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="descripcionUso" name="descripcionUso" placeholder='Descripción de Uso' />
                        </div>
                    </div>
                    <div className="col-md-6">
                        <button type="submit" className="btn btn-primary w-50">Procesar</button>
                    </div>
                </div>
                    
            </form>
        </>
    )
}
