import { useDispatch, useSelector } from 'react-redux';
import { onOpenModal, onCloseModal } from '../../../store';

export const useClienteStore = () => {

    const dispatch = useDispatch();
    const { isModalOpen } = useSelector(state => state.cliente);

    const openModal = () => {
        dispatch(onOpenModal());
    }

    const closeModal = () => {
        dispatch(onCloseModal());
    }

    const toggleModal = () => {
        (isModalOpen)
            ? closeModal()
            : openModal()
    }

    return {
        //*Propiedades
        isModalOpen,

        //*Métodos
        openModal,
        closeModal,
        toggleModal
    }

}