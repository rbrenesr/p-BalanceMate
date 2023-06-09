
import { useCuenta } from '../hooks';
import { CatalogoList, CatalogoAdd } from '../components';

export const CatalogoPage = () => {

  const { cuentas, handleDeleteCuenta, handleNewCuenta } = useCuenta();


  return (
    <>
      <h2 className="mb-3">Catálogo contable</h2>
      <CatalogoAdd onNewCuenta={ handleNewCuenta } />
      <div className="row">
        <div className="col">
          <CatalogoList
            cuentas={cuentas}
            handleDeleteCuenta={(cuenta) => handleDeleteCuenta(cuenta)}
          />
        </div>
      </div>

      <br />
      <br />

    </>
  )
}
