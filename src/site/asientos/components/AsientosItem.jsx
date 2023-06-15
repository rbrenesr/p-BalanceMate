import Swal from "sweetalert2";

export const AsientosItem = ({
  asiento,
  handleEditAsiento,
  handleDeleteAsiento,
}
) => {


  const onEditAsiento = (asiento) => {
    handleEditAsiento(asiento.id);
  }

  const onDeleteAsiento = (asiento) => {

    Swal.fire({
      title: 'Confirmación!',
      text: `Va a elimianr el cliente:  ${asiento.numero}`,
      icon: 'warning',
      showConfirmButton: true,
      showCancelButton: true,
      confirmButtonText: "Eliminar",
      cancelButtonText: "Cancelar",
    }
    ).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {

        handleDeleteAsiento(asiento.id);
        Swal.fire('Registro eliminado con exito.', '', 'success');

      } else
        Swal.fire(' Cancelado', '', 'error')

    });
  }

  return (
    <>
      <tr>
        <td>{asiento.id} </td>
        <td>{asiento.numero}</td>
        <td>{asiento.fecha}</td>
        <td>{asiento.concepto}</td>
        <td>{asiento.totalDebe}</td>
        <td>{asiento.totalHaber}</td>
        <td>{asiento.estado}</td>
        <td><button className="btn btn-warning" onClick={c => onEditAsiento(asiento)}></button></td>
        <td><button className="btn btn-danger" onClick={c => onDeleteAsiento(asiento)}></button></td>
        {/* <td><button className="btn btn-danger" onClick={ id => handleDeleteAsientos(asientos.id) }>x</button></td> */}
      </tr>
    </>
  )
}


