import Swal from "sweetalert2";
import { useAsientosStore } from "../hooks/useAsientosStore";

export const AsientosDetItemList = ({ lineaAsiento, }) => {


  const { deleteAsientoDetItem, editAsientoDetItem} = useAsientosStore();

  const handleDeleteAsientosDetItem = (id) => {
    

    Swal.fire({
      title: 'Confirmación!',
      text: `Se va a eliminar la línea:  ${id}`,
      icon: 'warning',
      showConfirmButton: true,
      showCancelButton: true,
      confirmButtonText: "Eliminar",
      cancelButtonText: "Cancelar",
    }
    ).then((result) => {      
      if (result.isConfirmed) {
        deleteAsientoDetItem(id);
        Swal.fire('Registro eliminado con exito.', '', 'success');
      } else
        Swal.fire(' Cancelado', '', 'error');
    });

  }

  const handleEditAsientosDetItem = (id) => {
    editAsientoDetItem(id);
  };

  return (
    <>
      <tr>
        <td>{lineaAsiento.id} </td>
        <td>{lineaAsiento.cuenta}</td>
        <td>{lineaAsiento.descripcion}</td>
        <td>{lineaAsiento.observaciones}</td>
        <td>{lineaAsiento.tDocumento}</td>
        <td>{lineaAsiento.nDocumento}</td>
        <td>{lineaAsiento.tercero}</td>
        <td>{lineaAsiento.debe}</td>
        <td>{lineaAsiento.haber}</td>
        <td><button className="btn btn-info" onClick={id => handleEditAsientosDetItem(lineaAsiento.id)}></button></td>
        <td><button className="btn btn-danger" onClick={id => handleDeleteAsientosDetItem(lineaAsiento.id)}></button></td>
      </tr>
    </>
  )
}


