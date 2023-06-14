
import { useCustomerStore } from '../hooks/';
import { CustomerModal, CustomerList, CustomerSearch } from '../components'


export const ClientesPage = () => {

  const { openModal, loadCustomers, customers, newCustomer, deleteCustomer } = useCustomerStore();
  const onDoubleClick = (event) => {
    // openModal();
    newCustomer({
      "id":Math.floor(Math.random() * 1000) + 1,
      "cedula": "123456789",
      "nombre": "Juan Pérez",
      "email": "juan.perez@example.com",
      "telefono": "555-1234",
      "direccion": "Calle Principal 123",
      "notas": "Cliente regular"
    },);
    
  }


  return (
    <>
      <CustomerModal />

      <h2 className="mb-3">Clientes</h2>

      <div className="row d-flex justify-content-around my-3">
        <div className="col"><h3>Datos</h3></div>
        <div className="col d-flex justify-content-end">
          <button type="submit" className="btn btn-primary" onClick={onDoubleClick}>+</button>
        </div>
      </div>

      <div className="row">
        <div className="col">
          <CustomerSearch/>
        </div>
      </div>

      <div className="row">
        <div className="col">
          <CustomerList customers={customers} handleDeleteCustomer={ (customer)=>{ deleteCustomer(customer) } }/>
        </div>
      </div>

      <br />
      <br />
    </>
  )
}
