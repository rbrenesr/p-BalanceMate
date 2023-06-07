import { ClientesModal } from '../components/ClientesModal';
import { useClienteStore, } from '../hooks/useClienteStore';


export const ClientesPage = () => {

  const { openModal } = useClienteStore();

  const onDoubleClick = (event) => {
    // event.preventDefault();    
    openModal();
  }

  return (
    <>
      <ClientesModal />
      <h2 className="mb-3">Clientes</h2>
        <div className="row d-flex justify-content-around my-3">
          <div className="col"><h3>Datos</h3></div>
        </div>
        <div className="row d-flex justify-content-around">
          <div className="col-md-22">
            <div className="col d-flex justify-content-end">
              <button type="submit" className="btn btn-primary" onClick={onDoubleClick}>+</button>
            </div>
          </div>
        </div>
        <br />
        <br />     
    </>
  )
}
