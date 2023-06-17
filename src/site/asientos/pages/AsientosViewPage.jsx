import { useLocation, useNavigate } from 'react-router-dom';
import { AsientosList, AsientosSearch } from '../components'
import { useAsientosStore } from '../hooks/';
import Swal from "sweetalert2";

export const AsientosViewPage = () => {

  const { asientos, handleEditAsiento, deleteAsiento } = useAsientosStore();
  const navigate = useNavigate();
  const location = useLocation();


  const onDoubleClick = (event) => {
    // Swal.fire({
    //   title: 'Confirmación!',
    //   text: `Reenvío a mantenimiento de asientos`,
    //   icon: 'success',
    //   confirmButtonText: 'Perfecto.'      
    // });


    // navigate(`/asientos/?q=${ searchText }`);
     navigate(`/asientos`);

  }

  return (
    <div className=' fade-in'>
      <h2 className="mb-3">Asientos</h2>

      <div className="row d-flex justify-content-around my-3">
        <div className="col"><h3>Datos</h3></div>
        <div className="col d-flex justify-content-end">
          <button type="submit" className="btn btn-primary" onClick={onDoubleClick}>+</button>
        </div>
      </div>

      <div className="row">
        <div className="col">
          <AsientosSearch />
        </div>
      </div>

      <div className="row">
        <div className="col">
          <AsientosList
            asientos={asientos}
            handleEditAsiento={(asiento) => { deleteAsiento(asiento) }}
            handleDeleteAsiento={(asiento) => { deleteAsiento(asiento) }}
          />
        </div>
      </div>

      <br />
      <br />
    </div>
  )
}
