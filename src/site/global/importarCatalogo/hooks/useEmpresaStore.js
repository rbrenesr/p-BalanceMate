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


    const selectEmpresa = async () => {


        dispatch(onLoading(true));
        await sleep(1000);

        //TODO 
        //*Realizar la llamda al api de select emrpesa
        //TRABAJANDO fetch
        // const resp = await fetch(`https://balancemate/api/v1/empresa`);
        // const data = await resp.json();
        // console.log(data);

        const data = {
            "id": 0,
            "codigo": 'EMP01',
            "nombre": 'BalanceMate',
            "cedula": '304140227',
            "email": 'balancemate@balance.com',
            "telefonoI": '+506 1234-1234',
            "telefonoII": '+506 1234-1234',
            "paginaWeb": 'https://www.balancemate.com',
            "repLegalNombre": 'Rafael Brenes',
            "repLegalCedula": '304140227',
            "repLegalTelefono": '+506 8329-0634',
            "repLegalEmail": 'rbrenesr@gmail.com',
        };


        dispatch(onSelectEmpresa(data));

        dispatch(onLoading(false));
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
