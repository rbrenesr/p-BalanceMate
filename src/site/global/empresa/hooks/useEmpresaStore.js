import { useDispatch, useSelector } from 'react-redux';
import Swal from "sweetalert2";
import balanceApi from '../../../../api/balanceApi';
import {
    isLoading,
    onLoading, onSelectEmpresa, onSaveEmpresa, onUpdateEmpresa,
} from '../store/empresaSlice';


export const useEmpresaStore = () => {

    const dispatch = useDispatch();
    const { isLoading, empresa } = useSelector(state => state.empresa);

    async function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    const selectEmpresa = async (baseDatos) => {

        dispatch(onLoading(true));
        const { data: { empresa } } = await balanceApi.get(`/empresa/baseDatos/${baseDatos}`);
        const emp = empresa[0];
        dispatch(onSelectEmpresa(emp));
        dispatch(onLoading(false));
    }


    const saveEmpresa = async (empresa) => {
        dispatch(onLoading(true));
        const { data } = await balanceApi.put(`/empresa/${empresa.id}`, empresa);
        dispatch(onSaveEmpresa(empresa));
        dispatch(onLoading(false));
        Swal.fire({
            title: 'Confirmación!',
            text: `Proceso aplicado con éxito!`,
            icon: 'success',
            confirmButtonText: 'Perfecto!'
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
