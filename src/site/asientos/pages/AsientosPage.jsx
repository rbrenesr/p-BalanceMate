
import { AsientoEnc, AsientoDet, AsientosDetItemAdd } from '../components'
import { useAsientosStore } from '../hooks';
import '../styles/AsientosPage.css'

export const AsientosPage = () => {

  const {newAsiento} = useAsientosStore();


  const handleClickNew = () => { 
    newAsiento([{}]);
  }

  return (
    <>
      <h2 className="mb-3">Asientos</h2>




      <div className='encabezadoCSS'>
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


      <div className="row">
        <div className="col">
          <AsientosDetItemAdd />
        </div>
      </div>
      <hr />
      <div className="row">
        <div className="col">
          <AsientoDet />
        </div>
      </div>

      <br />
      <br />
    </>
  )
}
