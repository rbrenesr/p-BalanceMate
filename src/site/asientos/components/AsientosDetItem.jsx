import Swal from "sweetalert2";

export const AsientosDetItem = ({lineaAsiento,}) => {


  // const onEditAsiento = (asiento) => {
  //   handleEditAsiento(asiento.id);
  // }

  // const onDeleteAsiento = (asiento) => {

  //   Swal.fire({
  //     title: 'Confirmación!',
  //     text: `Va a elimianr el cliente:  ${asiento.numero}`,
  //     icon: 'warning',
  //     showConfirmButton: true,
  //     showCancelButton: true,
  //     confirmButtonText: "Eliminar",
  //     cancelButtonText: "Cancelar",
  //   }
  //   ).then((result) => {
  //     /* Read more about isConfirmed, isDenied below */
  //     if (result.isConfirmed) {

  //       handleDeleteAsiento(asiento.id);
  //       Swal.fire('Registro eliminado con exito.', '', 'success');

  //     } else
  //       Swal.fire(' Cancelado', '', 'error')

  //   });
  // }

  return (
    <>
      <tr>
        <td>{lineaAsiento.id} </td>
        <td>{lineaAsiento.cuenta}</td>
        <td>{lineaAsiento.descripcion}</td>
        <td>{lineaAsiento.observaciones}</td>
        <td>{lineaAsiento.tDocumento}</td>
        <td>{lineaAsiento.nDocumentor}</td>
        <td>{lineaAsiento.tercero}</td>
        <td>{lineaAsiento.debe}</td>
        <td>{lineaAsiento.haber}</td>
        {/* <td><button className="btn btn-warning" onClick={c => onEditAsiento(asiento)}></button></td>
        <td><button className="btn btn-danger" onClick={c => onDeleteAsiento(asiento)}></button></td> */}
        {/* <td><button className="btn btn-danger" onClick={ id => handleDeleteAsientos(asientos.id) }>x</button></td> */}
      </tr>
    </>
  )
}


