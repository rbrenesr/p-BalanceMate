import { useEffect, useReducer } from "react"
import { cuentaReducer } from "../reducer/cuentaRedurcer";

export const useCuenta = () => {

    const initialState = [
        {
            id: "1",
            description:'ACTIVO',
            done: false
        },
        {
            id: "1-1",
            description:'ACTIVO CORRIENTE',
            done: false
        },
        {
            id: "1-1-1",
            description:'EFECTIVOS Y EQUIVALENTESA',
            done: false
        },
        {
            id: "1-1-1-02",
            description:'BANCOS',
            done: false
        },
        {
            id: "1-1-1-02-01",
            description:'MONEDA NACIONAL',
            done: false
        },
        {
            id: "1-1-1-02-01-001",
            description:'BNCR 56465465',
            done: false
        },
        {
            id: "1-1-1-02-01-002",
            description:'BPDC 654654654',
            done: false
        }
    ];

    const init = () => {
        return JSON.parse(localStorage.getItem('Cuentas')) || [];
    }

    const [cuentas, dispatch] = useReducer(cuentaReducer, initialState);
    // const [cuentas, dispatch] = useReducer(cuentaReducer, initialState, init);



    useEffect(() => {

        localStorage.setItem('Cuentas', JSON.stringify(cuentas));

    }, [cuentas])


    const handleNewCuenta = (Cuenta) => {

        const action = {
            type: '[TODO] Add Cuenta',
            payload: Todo
        }
        dispatch(Cuenta);
    }

    const handleDeleteCuenta = (id) => {

        const action = {
            type: '[TODO] Delete Cuenta',
            payload: id
        }
        dispatch(action);
    }

    const cuentasCount = () => {
        return cuentas.length;
    }


    return {
        cuentas,
        todosCount: cuentasCount(),                
        handleDeleteCuenta,
        handleNewCuenta
    }

}