import React, { useEffect } from 'react'
import { useImportarStore } from '../hooks/useImportarStore'
import { useForm } from '../../../../hooks';
import { LoadingSpinner } from '../../../../components/LoadingSpinner';



export const ImportarCatalogo = () => {

  const { isLoading, empresas, getEmpresas, importarCatalogo } = useImportarStore();
  let newEmpresas = [{ 'id': 0, 'nombre': 'Seleccione' }, ...empresas];



  const {
    empresa,

    onInputChange,
  } = useForm({
    empresa: '0',
    empresaName: 'Seleccione',
  });


  useEffect(() => {
    newEmpresas = [{ 'id': 0, 'nombre': 'Seleccione' }, ...empresas];

  }, [empresas])





  const onSubmit = (event) => {
    event.preventDefault();
    console.log(empresa);
    importarCatalogo(empresa);

  }

  return (
    <div className="fade-in">

      <h2 className="mb-3">Importación de Catálogo</h2>

      <p>Este proceso le permite cargar un Catálogo a la compañía actual, desde una de las compañias del grupo</p>

      <form>
        <div className="row d-flex justify-content-around my-3">
          <div className="col"><h5>Seleccione la compañía</h5></div>
        </div>
        <div className="row d-flex justify-content-start">
          <div className="col-4">
            <select
              className="form-select"
              style={{'width':'300px'}}
              aria-label="empresa"
              id="empresa"
              name="empresa"
              defaultValue={empresa}
              onChange={onInputChange}
            >
              {
                newEmpresas.map(
                  empresa => (
                    <option key={empresa.id} value={empresa.id}>
                      {empresa.nombre}
                    </option>
                  )
                )
              }
            </select>
          </div>
        </div>


        <div className="row d-flex justify-content-start my-3">
          <div className="col-4">
            <button type="submit" className="btn btn-primary m-2" style={{ 'width': '15rem' }} onClick={onSubmit}>Procesar</button>
          </div>
        </div>

        {
          isLoading ? <LoadingSpinner /> : '.'
        }



        <br />
        <br />
      </form>
    </div>
  )
}
