import Modal from "react-modal";
import Swal from "sweetalert2";
import { useCustomerStore } from '../hooks';
import { useForm } from "../../../hooks";

Modal.setAppElement("#root"); //*Agrega el modal al root

export const CustomerModal = () => {

  const customStyles = {
    content: {
      top: "50%",
      left: "50%",
      right: "auto",
      bottom: "auto",
      marginRight: "-50%",
      transform: "translate(-50%, -50%)",
      height: "450px"
    },
  };


  const { isModalOpen, closeModal } = useCustomerStore();

  const {
    cedula,
    nombre,
    email,
    telefono,
    direccion,
    notas,

    onInputChange,
    onResetForm
  } = useForm(
    {
      cedula: '123465798',
      nombre: 'Nombre del cliente',
      email: 'email@email.com',
      telefono: '0000-0000',
      direccion: 'CR',
      notas: 'Notas',
    }
  );



  const onCloseModal = () => {
    closeModal();
  }

  const onSubmit = (event) => {
    event.preventDefault();
    console.log({
      cedula,
      nombre,
      email,
      telefono,
      direccion,
      notas,
    });
    onResetForm();

    Swal.fire({
      title: 'Confirmación!',
      text: 'Proceso aplicado con éxito',
      icon: 'success',
      confirmButtonText: 'Perfecto'
    });

    closeModal();
  }

  return (
    <Modal
      isOpen={isModalOpen}
      onRequestClose={onCloseModal}
      style={customStyles}
      contentLabel="Example Modal"
      className="modal"
      overlayClassName="modal-fondo"
      closeTimeoutMS={200}
    >
      <h3>Cliente</h3>
      <hr />
      <form className="container" onSubmit={onSubmit}>
        <div className="form-group mb-2">
          <div className="mb-3">
            <input
              type="text"
              className="form-control"
              id="cedula"
              name="cedula"
              placeholder='Cédula - ID'
              autoComplete="false"
              value={cedula}
              onChange={onInputChange}
            />
          </div>
          <div className="mb-3">
            <input
              type="text"
              className="form-control"
              id="nombre"
              name="nombre"
              placeholder='Nombre'
              autoComplete="false"
              value={nombre}
              onChange={onInputChange}
            />
          </div>
          <div className="mb-3">
            <input
              type="email"
              className="form-control"
              id="email"
              name="email"
              placeholder='Email'
              autoComplete="false"
              value={email}
              onChange={onInputChange}
            />
          </div>
          <div className="mb-3">
            <input
              type="text"
              className="form-control"
              id="telefono"
              name="telefono"
              placeholder='Teléfono'
              autoComplete="false"
              value={telefono}
              onChange={onInputChange}
            />
          </div>
        </div>

        <div className="form-group mb-2">
          <div className="mb-3">
            <textarea
              type="text"
              className="form-control"
              id="direccion"
              placeholder="Dirección"
              rows="2"
              name="direccion"
              value={direccion}
              onChange={onInputChange}
            ></textarea>
          </div>
          <div className="mb-3">
            <textarea
              type="text"
              className="form-control"
              id="notas"
              placeholder="Notas"
              rows="5"
              name="notas"
              value={notas}
              onChange={onInputChange}
            ></textarea>
          </div>
        </div>

        <button type="submit" className="btn btn-outline-primary btn-block">
          <i className="far fa-save"></i>
          <span> Guardar</span>
        </button>

      </form>
    </Modal>
  )
}
