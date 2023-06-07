
import { TipoAsientoItem } from "./TipoAsientoItem"

export const TipoAsientoList = ({ tiposAsientos = [], handleDelete }) => {


    return (
        <>
            <table id="tiposAsientos" className="table table-striped table-light table-sm" style={{ "width": "100%" }}>
                <thead>
                    <tr>
                        <th>Código</th>                        
                        <th>Descripción</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {
                        tiposAsientos.map((tipoAsiento) => (
                            <TipoAsientoItem
                                key={tipoAsiento.id}
                                tipoAsiento={tipoAsiento}
                                handleDelete={(tipoAsiento) => handleDelete(tipoAsiento)}
                            />
                        ))
                    }
                </tbody>
            </table>

        </>
    )
}

//   return (
//     <ul className="list-group">
//             {
//                 cuentas.map( (cuenta)=>(
//                     <CatalogoItem
//                       key={cuenta.id}
//                       cuenta={ cuenta }
//                       handleDeleteCuenta={ (cuenta)=>handleDeleteCuenta(cuenta) }
//                      />
//                     ))
//             }
//         </ul>
//   )
// }
