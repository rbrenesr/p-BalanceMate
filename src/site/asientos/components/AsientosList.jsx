 import { AsientosItem } from "./AsientosItem"

export const AsientosList = ({ asientos = [], handleDeleteCustomer }) => {

    return (
        <>
            <table id="asientos" className="table table-striped table-light table-sm" style={{ "width": "100%" }}>
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Cédula</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Notas</th>                        
                    </tr>
                </thead>
                <tbody>
                    {
                        asientos.map((customer) => (
                            <AsientosItem
                                key={customer.id}
                                asientos={customer}
                                handleDeleteAsientos={(asiento) => handleDeleteAsientos(asiento)}
                            />
                        ))
                    }

                </tbody>
            </table>
        </>
    )
}
