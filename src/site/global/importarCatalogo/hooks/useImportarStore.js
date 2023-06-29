import { useDispatch, useSelector } from 'react-redux';
import Swal from "sweetalert2";
import {
    isLoading,

    onLoad,
    onGetEmpresas,
} from '../store/importarSlice';

export const useImportarStore = () => {


    const dispatch = useDispatch();
    const { isLoading, empresas } = useSelector(state => state.importar);

    const getEmpresas = () => {

    }
    const importarCatalogo = ( empresaId ) => {

    }

    return {
        isLoading,
        empresas,
        
        getEmpresas,        
        importarCatalogo,
    }
}