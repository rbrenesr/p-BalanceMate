import { useDispatch, useSelector } from 'react-redux';
import Swal from "sweetalert2";

import {
    isLoading,
    onLoading, onSelectConfiguracion, onSaveConfiguracion,
} from '../store/configuracionSlice';


export const useConfiguracionStore = () => {
    const dispatch = useDispatch();

    const { isLoading, configuracion } = useSelector(state => state.configuracion);

    async function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    const selectConfiguracion = async () => {


        dispatch(onLoading(true));
        await sleep(1000);

        //TODO 
        //*Realizar la llamda al api de select emrpesa
        //TRABAJANDO fetch
        // const resp = await fetch(`https://balancemate/api/v1/empresa`);
        // const data = await resp.json();
        // console.log(data);

        //obtener el dia actual
        const date = new Date();
        let day = date.getDate();
        let month = date.getMonth() + 1;
        let year = date.getFullYear();
        let fechaTemp = `${day}-${month}-${year}`;

        const data = {
            "fechaInicioPeriodo": fechaTemp,
            "fechaFinPeriodo": fechaTemp,
            "fechaInactividad": fechaTemp,
            "ctaUtilPerdPeriodo": '3-01-001-0001',
            "ctaUtilPerdAcumulada": '4-01-001-0001',
            "ctaInventarios": '1-01-001-0001',
            "ctaCostoVentas": '5-01-001-0001',
            "ctaActivoCirculante": '1-01-001-0001',
            "ctaPasivoLargoPlazo": '2-01-001-0001',
            "ctaActivoTotal": '1-01',
            "ctaPasivoTotal": '2-01',
            "ctaCapital": '7-01',
            "ctaVentas": '3-01',
        };


        dispatch(onSelectConfiguracion(data));

        dispatch(onLoading(false));
    }

    const saveConfiguracion = async (conf) => {

        dispatch(onLoading(true));
        dispatch(onSaveConfiguracion(conf));

        await sleep(1000);

        dispatch(onLoading(false));
        Swal.fire({
            title: 'Confirmación!',
            text: `Proceso aplicado con éxito!`,
            icon: 'success',
            confirmButtonText: 'Perfecto'
        });
    }

    return {        
        isLoading,
        configuracion,

        selectConfiguracion,
        saveConfiguracion,        
    }

}
