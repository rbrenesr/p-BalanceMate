import React from 'react'

export const ImportarCatalogo = () => {
  return (
    <div className="fade-in">

      <h2 className="mb-3">Importación de Catálogo</h2>

      <p>Este proceso le permite cargar un Catálogo a la compañía actual, desde una de las compañias del grupo</p>

      <form>
        <div className="row d-flex justify-content-around my-3">
          <div className="col"><h3>Datos</h3></div>
        </div>
        <div className="row d-flex justify-content-around my-3">
          <div className="col">

            <select class="form-select" multiple aria-label="Ejemplo de multiple select">
              <option selected>Seleccione la compañia origen</option>
              <option value="1">Asociados Varela</option>
              <option value="2">Dos</option>
              <option value="3">Tres</option>
            </select>

          </div>
        </div>





        <br />
        <br />



      </form>
    </div>
  )
}
