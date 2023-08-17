
import { useCuentaStore } from '../hooks';
import { CatalogoList, CatalogoAdd } from '../components';

export const CatalogoPage = () => {

  const { catalogo, handleDeleteAccount } = useCuentaStore();


  return (
    <>
      <h2 className="mb-3">Catálogo contable</h2>
      <CatalogoAdd onNewCuenta />
      <div className="row">
        <div className="col">
          <CatalogoList
            cuentas={catalogo}
            handleDeleteCuenta={(cuenta) => handleDeleteAccount(cuenta)}
          />
        </div>
      </div>
      <br />
      <br />
    </>
  )
}
