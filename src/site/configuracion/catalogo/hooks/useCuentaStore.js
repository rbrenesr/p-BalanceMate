import { useDispatch, useSelector } from "react-redux";
import { onLoading, onStopLoading, onGetCatalogo, onGetCuenta, onUpdateCuenta, onDeleteAccount, onSaveCuenta } from '../store';


export const useCuentaStore = () => {

    const dispatch = useDispatch();
    const { isLoading, catalogo, cuentaSelected } = useSelector(state => state.catalogo);

    const handleNewAccount = (Cuenta) => {
        console.log('handleNewAccount');
        dispatch(onLoading);
        dispatch(onSaveCuenta(Cuenta));
        dispatch(onStopLoading);
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

        handleNewAccount,handleDeleteAccount, cuentasCount,        
    }

}