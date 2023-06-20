import { useDispatch, useSelector } from 'react-redux';
import Swal from "sweetalert2";

import {
    //propiedades
    isLoading,

    //funciones    
    onLoading,
    onSelectEmpresa,
    onSaveEmpresa,
    onUpdateEmpresa,
} from '../store/empresaSlice';


export const useEmpresaStore = () => {
    const dispatch = useDispatch();

    const { isLoading, empresa } = useSelector(state => state.empresa);



    async function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
      }


    const selectEmpresa = () => {
        dispatch(onSelectEmpresa());
    }
    const saveEmpresa =async(empresa) => {

        dispatch(onLoading(true));
        dispatch(onSaveEmpresa(empresa));

        await sleep(1000);
        
        dispatch(onLoading(false));
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
