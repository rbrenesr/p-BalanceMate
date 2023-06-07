import Modal from "react-modal";
import Swal from "sweetalert2";
import 'sweetalert2/dist/sweetalert2.min.css';

Modal.setAppElement("#root"); //*Agrega el modal al root

export const ClientesModal = () => {
  const customStyles = { //*Estilos básicos para el modal
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

  const isDateModalOpen = true;
  const onCloseModal = () => { }
  const onSubmit = () => { }
  const onInputChanged = () => { }
  const formValues = {}

  return (
    <Modal
      isOpen={isDateModalOpen}
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
            <input type="text" className="form-control" id="cedula" name="cedula" placeholder='Cédula - ID' required />
          </div>
          <div className="mb-3">
            <input type="text" className="form-control" id="nombre" name="nombre" placeholder='Nombre' required />
          </div>
          <div className="mb-3">
            <input type="email" className="form-control" id="correo" name="correo" placeholder='Email' required />
          </div>
          <div className="mb-3">
            <input type="text" className="form-control" id="telefono" name="telefono" placeholder='Teléfono' required />
          </div>
        </div>

        <div className="form-group mb-2">
          <div className="mb-3">
            <textarea
              type="text"
              className="form-control"
              placeholder="Dirección"
              rows="2"
              name="notes"
              value={formValues.notes}
              onChange={onInputChanged}
            ></textarea>
          </div>
          <div className="mb-3">
            <textarea
              type="text"
              className="form-control"
              placeholder="Notas"
              rows="5"
              name="notes"
              value={formValues.notes}
              onChange={onInputChanged}
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
