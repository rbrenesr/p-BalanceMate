import Swal from "sweetalert2";

export const AsientosItem = ({ asientos, handleDeleteAsientos }) => {

  const onDeleteAsientos = (id) => {

    Swal.fire({
      title: 'Confirmación!',
      text: `Va a elimianr el cliente:  ${asientos.nombre}`,
      icon: 'warning',
      showConfirmButton: true,
      showCancelButton: true,
      confirmButtonText: "Eliminar",
      cancelButtonText: "Cancelar",
    }
    ).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {

        handleDeleteAsientos(asientos.id);
        Swal.fire('Registro eliminado con exito.', '', 'success');

      } else
        Swal.fire(' Cancelado', '', 'error')

    });
  }

  return (
    <>
      <tr>
        <td>{asientos.id} </td>
        <td>{asientos.cedula}</td>
        <td>{asientos.nombre}</td>
        <td>{asientos.email}</td>
        <td>{asientos.telefono}</td>
        <td>{asientos.direccion}</td>
        <td>{asientos.notas}</td>
        <td><button className="btn btn-danger" onClick={ c => onDeleteAsientos(asientos) }>x</button></td>
        {/* <td><button className="btn btn-danger" onClick={ id => handleDeleteAsientos(asientos.id) }>x</button></td> */}
      </tr>
    </>
  )
}


