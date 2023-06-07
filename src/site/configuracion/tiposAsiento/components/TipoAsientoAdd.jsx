
import { useForm } from "../hooks/useForm";

import Swal from "sweetalert2";

export const TipoAsientoAdd = ({ onNew }) => {

    const { codigo, descripcion, onInputChange, onResetForm } = useForm({
        id: "",
        codigo:"",         
        descripcion:"",         
    });

    const onFormSubmit = (event) => {
        event.preventDefault();
        const nuevo = {
            id: new Date().getTime(),
            codigo: codigo,            
            descripcion: descripcion,            
        };

        console.log(nuevo);

        onNew(nuevo);
        Swal.fire('', 'Tipo de Asiento ingresada con éxito', '');
    }

    return (
        <>
            <form onSubmit={onFormSubmit}>

                <div className="row d-flex justify-content-around my-3">
                    <div className="col"><h5>Nueva tipo de asiento</h5></div>
                </div>

                <div className="row d-flex justify-content-around">
                    <div className="col-md-3">
                        <div className="mb-3">
                            <input type="text" className="form-control" id="codigo" name="codigo" placeholder='Código' value={codigo} onChange={onInputChange} />
                            {/* TODO: colocar required */}
                        </div>
                    </div>
                    <div className="col-md-6">
                        <div className="mb-3">
                        <input type="text" className="form-control" id="descripcion" name="descripcion" placeholder='Descripción'  value={descripcion} onChange={onInputChange} />
                        {/* TODO: colocar required */}
                        </div>
                    </div>     
                    <div className="col-md-3">
                        <button type="submit" className="btn btn-primary w-50">Procesar</button>
                    </div>               
                </div>

 

            </form>
        </>
    )
}
