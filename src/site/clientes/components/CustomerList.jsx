 import { CustomerItem } from "./CustomerItem"

export const CustomerList = ({ customers = [], handleDeleteCustomer }) => {

    return (
        <>
            <table id="customers" className="table table-striped table-light table-sm" style={{ "width": "100%" }}>
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
                        customers.map((customer) => (
                            <CustomerItem
                                key={customer.id}
                                customer={customer}
                                handleDeleteCustomer={(customer) => handleDeleteCustomer(customer)}
                            />
                        ))
                    }

                </tbody>
            </table>
        </>
    )
}
