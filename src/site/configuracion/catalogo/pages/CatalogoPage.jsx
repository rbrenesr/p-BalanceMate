
import { useCuenta } from '../hooks/useCuenta';
import { CatalogoList } from '../components/CatalogoList';
import { CatalogoAdd } from '../components/CatalogoAdd';

export const CatalogoPage = () => {

  const { cuentas, handleDeleteCuenta, handleNewCuenta } = useCuenta();


  return (
    <>
      <h2 className="mb-5">Catálogo contable</h2>

      <CatalogoAdd />

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
