import Swal from "sweetalert2";

export const CustomerItem = ({ customer, handleDeleteCustomer }) => {

  const onDeleteCustomer = (id) => {

    Swal.fire({
      title: 'Confirmación!',
      text: `Va a elimianr el cliente:  ${customer.nombre}`,
      icon: 'warning',
      showConfirmButton: true,
      showCancelButton: true,
      confirmButtonText: "Eliminar",
      cancelButtonText: "Cancelar",
    }
    ).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {

        handleDeleteCustomer(customer.id);
        Swal.fire('Registro eliminado con exito.', '', 'success');

      } else
        Swal.fire(' Cancelado', '', 'error')

    });
  }

  return (
    <>
      <tr>
        <td>{customer.id} </td>
        <td>{customer.cedula}</td>
        <td>{customer.nombre}</td>
        <td>{customer.email}</td>
        <td>{customer.telefono}</td>
        <td>{customer.direccion}</td>
        <td>{customer.notas}</td>
        <td><button className="btn btn-danger" onClick={ c => onDeleteCustomer(customer) }>x</button></td>
        {/* <td><button className="btn btn-danger" onClick={ id => handleDeleteCustomer(customer.id) }>x</button></td> */}
      </tr>
    </>
  )
}


