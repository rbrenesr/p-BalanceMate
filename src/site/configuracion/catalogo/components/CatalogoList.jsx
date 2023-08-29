
import { useCuentaStore } from "../hooks"
import { CatalogoItem } from "./CatalogoItem"

export const CatalogoList = () => {

    const { catalogo } = useCuentaStore();

    return (
        <>
            <table id="catalogo" className="table table-striped table-light table-sm" style={{ "width": "100%" }}>
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Tipo</th>
                        <th>Descripción</th>
                        <th>Descripción Uso</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {
                        catalogo.map((cuenta) => (
                            <CatalogoItem
                                key={cuenta.id}
                                cuenta={cuenta}                                
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
