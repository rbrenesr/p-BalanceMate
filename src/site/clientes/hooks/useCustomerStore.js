import { useDispatch, useSelector } from 'react-redux';
import { onOpenModal, onCloseModal, onLoadCustomers, onNewCustomer, onDeleteCustomer } from '../../../store';

export const useCustomerStore = () => {

    const dispatch = useDispatch();
    const { isModalOpen, isLoading, customers } = useSelector(state => state.customers);

    const openModal = () => { dispatch(onOpenModal()); }
    const closeModal = () => { dispatch(onCloseModal()); }
    const toggleModal = () => {
        (isModalOpen)
            ? closeModal()
            : openModal()
    }


    const loadCustomers = () => {dispatch(onLoadCustomers());}
    const newCustomer = ( newCustomer ) => {dispatch(onNewCustomer(newCustomer));}
    const deleteCustomer = ( Customer ) => {dispatch(onDeleteCustomer(Customer));}

    return {
        //*Propiedades
        isModalOpen,
        isLoading,
        customers,

        //*Métodos
        openModal,
        closeModal,
        toggleModal,
        loadCustomers,
        newCustomer,
        deleteCustomer
    }

}