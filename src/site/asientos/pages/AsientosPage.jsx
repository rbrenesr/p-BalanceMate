

import { useNavigate } from 'react-router-dom';
import { AsientoEnc, AsientoDet, AsientosDetItemAdd } from '../components'
import { useAsientosStore } from '../hooks';
import '../styles/AsientosPage.css'

export const AsientosPage = () => {

  const { newAsiento } = useAsientosStore();
  const navigate = useNavigate();

  const handleClickNew = () => {
    const tipoAsiento = document.getElementById("tipoDeAsiento").value;
    const fecha = document.getElementById("fecha").value;
    const concepto = document.getElementById("concepto").value;
    const total = document.getElementById("totalDebe").innerText;
    const diferencia = document.getElementById("diferencia").innerText;
      
    newAsiento({
      "id": "0",
      "numero": "ASE202306-00001",
      "tipoAsiento": tipoAsiento,
      "fecha": fecha,
      "concepto":concepto,
      "total": total,
      "diferencia": diferencia,
      "estado": "aplicado",
    });

    navigate('/asientosView');

  }

  return (
    <div className='fade-in'>
      <h2 className="mb-3">Asientos</h2>
      <div>
        <div className="row">
          <div className="col">
            <AsientoEnc />
            <button
              className="btn btn-primary fab"
              onClick={handleClickNew}
            >
              <i className="fas fa-plus" ></i>
            </button>
          </div>
        </div>
      </div>
      <hr />
      <div className="row mb-5">
        <div className="col">
          <AsientosDetItemAdd />
        </div>
      </div>

      <div className="row">
        <div className="col">
          <AsientoDet />
        </div>
      </div>

      <br />
      <br />
    </div>
  )
}
