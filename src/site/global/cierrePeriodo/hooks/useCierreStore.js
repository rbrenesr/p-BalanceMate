import { useDispatch, useSelector } from 'react-redux';
import Swal from "sweetalert2";

import {
    //propiedades
    isLoading,

    //funciones    
    onLoading,
    onClosingAccountingPeriod,
} from '../store/cierreSlice';


export const useCierreStore = () => {
    const dispatch = useDispatch();

    const { isLoading, cierre } = useSelector(state => state.empresa);



    async function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
      }


    const closeAccountingPeriod=async()=>{
        dispatch(onLoading(true));
        await sleep(1000);
        dispatch(onClosingAccountingPeriod());

        dispatch(onLoading(false));
    }



    return {
        //*Propiedades asientos
        isLoading,
        cierre,

        //*Métodos asientos
        closeAccountingPeriod,
    }

}
