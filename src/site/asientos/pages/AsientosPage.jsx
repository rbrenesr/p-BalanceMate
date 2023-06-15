
import { AsientosList, AsientosSearch } from '../components'
import { useAsientosStore } from '../hooks';


export const AsientosPage = () => {

  const { asientos, newAsiento, deleteAsiento } = useAsientosStore();
  const onDoubleClick = (event) => {    
    newAsiento(
      {
        "id": Math.floor(Math.random() * 1000) + 1,
        "docReferencia": "123456789",
        "fecha": "Juan Pérez",
        "concepto": "juan.perez@example.com",
        "monto": "125253.35",
        "estado": "aplicado"
      },
    );
  }


  return (
    <>
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
          <AsientosList asientos={asientos} handleDeleteAsientos={(asiento) => { deleteAsiento(asiento) }} />
        </div>
      </div>

      <br />
      <br />
    </>
  )
}
