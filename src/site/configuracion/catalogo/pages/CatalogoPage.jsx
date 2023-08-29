import { CatalogoList, CatalogoAdd } from '../components';

export const CatalogoPage = () => {

  return (
    <>
      <h2 className="mb-3">Catálogo contable</h2>
      <CatalogoAdd onNewCuenta />
      <div className="row">
        <div className="col">
          <CatalogoList />
        </div>
      </div>
      <br />
      <br />
    </>
  )
}
