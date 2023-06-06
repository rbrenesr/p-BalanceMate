import { useEffect, useReducer } from "react"
import { cuentaReducer } from "../reducer/cuentaRedurcer";

export const useCuenta = () => {

    const initialState = [
        {
            id:'1',
            codigoMadre: "",
            cuenta: "1",            
            tipo: "ACT",            
            descripcion:'ACTIVO',
            descripcionUso: 'ACTIVO'
        },
        {
            id:'1-01',
            codigoMadre: "",
            cuenta: "1-01",            
            tipo: "ACT",            
            descripcion:'ACTIVO CORRIENTE',
            descripcionUso: 'ACTIVO'
        },
        {
            id:'1-01-001',
            codigoMadre: "",
            cuenta: "1-01-001",            
            tipo: "ACT",            
            descripcion:'EFECTIVO',
            descripcionUso: 'ACTIVO'
        },
        {
            id:'1-01-001-0001',
            codigoMadre: "",
            cuenta: "1-01-001-001",            
            tipo: "ACT",            
            descripcion:'BANCOS NACIONALES',
            descripcionUso: 'ACTIVO'
        },
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
            payload: Cuenta
        }        
        dispatch(action);
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