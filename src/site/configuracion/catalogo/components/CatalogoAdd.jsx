
import { useForm } from "../hooks/useForm";

import Swal from "sweetalert2";

export const CatalogoAdd = ({ onNewCuenta }) => {

    const { cuentaMadre, cuenta, tipo, descripcion, descripcionUso, onInputChange, onResetForm } = useForm({
        id: "",
        cuentaMadre:"", 
        cuenta:"", 
        tipo:"", 
        descripcion:"", 
        descripcionUso:""
    });

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

                <div className="row d-flex justify-content-around my-3">
                    <div className="col"><h5>Nueva cuenta</h5></div>
                </div>

                <div className="row d-flex justify-content-around">
                    <div className="col-md-2">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="cuentaMadre" name="cuentaMadre" placeholder='Cuenta madre' value={cuentaMadre} onChange={onInputChange} />
                            {/* TODO: colocar required */}
                        </div>
                    </div>
                    <div className="col-md-2">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="cuenta" name="cuenta" placeholder='Cuenta' value={cuenta} onChange={onInputChange} />
                        </div>
                    </div>
                    <div className="col-md-2">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="tipo" name="tipo" placeholder='Tipo cuenta'  value={tipo} onChange={onInputChange} />
                        </div>
                    </div>
                    <div className="col-md-6">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="descripcion" name="descripcion" placeholder='Descripción'  value={descripcion} onChange={onInputChange} />
                        </div>
                    </div>
                </div>

                <div className="row">
                    <div className="col-md-6">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="descripcionUso" name="descripcionUso" placeholder='Descripción de Uso'  value={descripcionUso} onChange={onInputChange} />
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
