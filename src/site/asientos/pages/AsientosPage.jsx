
import { AsientoEnc, AsientoDet } from '../components'
import { useAsientosStore } from '../hooks';
import '../styles/AsientosPage.css'

export const AsientosPage = () => {

  const onDoubleClick = (event) => {}

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
      <div className="row d-flex justify-content-around my-3">
        <div className="col d-flex justify-content-start">
          <button type="submit" className="btn btn-primary" onClick={onDoubleClick}>+</button>
        </div>
      </div>

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
