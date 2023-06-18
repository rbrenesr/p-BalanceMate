 import { AsientosItem } from "./AsientosItem"

export const AsientosList = ({ asientos = [], handleEditAsiento, handleDeleteAsiento,  }) => {

    return (
        <>
            <table id="tableView" className="table table-striped table-light table-sm" style={{ "width": "100%" }}>
                <thead>
                    <tr>
                        <th>id</th>
                        <th>#Asiento</th>
                        <th>Tipo Asiento</th>
                        <th>Fecha</th>
                        <th>Concepto</th>
                        <th>Total</th>                        
                        <th>Estado</th>                        
                        <th>Editar</th>                        
                        <th>Elimianr</th>                        
                    </tr>
                </thead>
                <tbody>
                    {
                        asientos.map((asiento) => (
                            <AsientosItem
                                key={asiento.id}
                                asiento={asiento}
                                handleEditAsiento={(asiento) => handleEditAsiento(asiento)}
                                handleDeleteAsiento={(asiento) => handleDeleteAsiento(asiento)}
                            />
                        ))
                    }

                </tbody>
            </table>
        </>
    )
}
