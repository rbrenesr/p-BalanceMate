import { useDispatch, useSelector } from 'react-redux';
import Swal from "sweetalert2";

import {
    //propiedades
    isLoading,

    //funciones    
    onSelectEmpresa,
    onSaveEmpresa,
    onUpdateEmpresa,
} from '../store/empresaSlice';


export const useEmpresaStore = () => {
    const dispatch = useDispatch();

    const { isLoading, empresa } = useSelector(state => state.empresa);

    const selectEmpresa = () => {
        dispatch(onSelectEmpresa());
    }
    const saveEmpresa = (empresa) => {
        dispatch(onSaveEmpresa(empresa));
        Swal.fire({
            title: 'Confirmación!',
            text: `Proceso aplicado con éxito!`,
            icon: 'success',
            confirmButtonText: 'Perfecto'
        });
    }
    const updateEmpresa = (empresa) => {
        dispatch(onUpdateEmpresa(empresa));
        Swal.fire({
            title: 'Confirmación!',
            text: `Proceso aplicado con éxito!`,
            icon: 'success',
            confirmButtonText: 'Perfecto'
        });
    }

    return {
        //*Propiedades asientos
        isLoading,
        empresa,

        //*Métodos asientos
        selectEmpresa,
        saveEmpresa,
        updateEmpresa,
    }

}
