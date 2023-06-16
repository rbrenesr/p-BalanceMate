
import { AsientoEnc, AsientoDet, AsientosDetItemAdd } from '../components'
import { useAsientosStore } from '../hooks';
import '../styles/AsientosPage.css'

export const AsientosPage = () => {

  const onDoubleClick = (event) => { }

  return (
    <>
      <h2 className="mb-3">Asientos</h2>

      <div className='encabezadoCSS'>
        <div className="row">
          <div className="col">
            <AsientoEnc />
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
