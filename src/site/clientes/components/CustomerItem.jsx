
export const CustomerItem =({ customer, handleDeleteCustomer }) => {

    return (
        <>
            <tr>
                <td>{customer.id} </td>
                <td>{ customer.cedula }</td>
                <td>{ customer.nombre }</td>
                <td>{ customer.email }</td>
                <td>{ customer.telefono }</td>
                <td>{ customer.direccion }</td>
                <td>{ customer.notas }</td>
                <td><button className="btn btn-danger" onClick={ id => handleDeleteCustomer(customer.id) }>x</button></td>
            </tr>
        </>
    )
}


