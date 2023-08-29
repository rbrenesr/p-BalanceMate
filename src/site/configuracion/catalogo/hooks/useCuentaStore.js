import { useDispatch, useSelector } from "react-redux";
import Swal from "sweetalert2";
import { onLoading, onStopLoading, onGetCatalogo, onGetCuenta, onUpdateCuenta, onDeleteAccount, onSaveCuenta } from '../store';


export const useCuentaStore = () => {

    const dispatch = useDispatch();
    const { isLoading, catalogo, cuentaSelected } = useSelector(state => state.catalogo);

    const handleNewAccount = (Cuenta) => {

        console.log(Cuenta)
        const propiedades = Object.keys(Cuenta);        
        if (!propiedades.every(propiedad => propiedad !== "descripcionUso" && Cuenta[propiedad])) {        
            Swal.fire('', 'Valores incompletos', '');
            return;
        }


        dispatch(onLoading);
        dispatch(onSaveCuenta(Cuenta));
        dispatch(onStopLoading);
        Swal.fire('', 'Cuenta contable ingresada con éxito', '');
    }

    const handleDeleteAccount = (id) => {
        console.log('handleDeleteAccount');
        dispatch(onLoading);
        dispatch(onDeleteAccount(id));
        dispatch(onStopLoading);
    }

    const cuentasCount = () => {
        console.log('cuentasCount');
    }

    return {
        isLoading, catalogo, cuentaSelected,

        handleNewAccount, handleDeleteAccount, cuentasCount,
    }

}