
import { useTipoAsiento } from '../hooks/useTipoAsiento';
import { TipoAsientoList } from '../components/TipoAsientoList';
import { TipoAsientoAdd } from '../components/TipoAsientoAdd';

export const TipoAsientoPage = () => {

  const { tiposAsientos, handleDelete, handleNew } = useTipoAsiento();


  return (
    <>
      <h2 className="mb-3">Tipos de Asiento</h2>
      <TipoAsientoAdd onNew={ handleNew } />
      <div className="row">
        <div className="col">
          <TipoAsientoList
            tiposAsientos={tiposAsientos}
            handleDelete={(tipoAsiento) => handleDelete(tipoAsiento)}
          />
        </div>
      </div>

      <br />
      <br />

    </>
  )
}
