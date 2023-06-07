import { useEffect, useReducer } from "react"
import { tipoAsientoReducer } from "../reducer/tipoAsientoRedurcer";

export const useTipoAsiento = () => {

    const initialState = [
        {
            id:'1',
            codigo: "ADF",            
            descripcion:'ASIENTO DIF CAMBIARIO',            
        },
        {
            id:'2',
            codigo: "ADP",            
            descripcion:'ASIENTO DEPRESIACION',       
        },       
    ];

    const init = () => {
        return JSON.parse(localStorage.getItem('TiposAsientos')) || [];
    }

    //const [tiposAsientos, dispatch] = useReducer(tipoAsientoReducer, initialState);
    const [tiposAsientos, dispatch] = useReducer(tipoAsientoReducer, initialState, init);

    useEffect(() => {
        localStorage.setItem('TiposAsientos', JSON.stringify(tiposAsientos));
    }, [tiposAsientos])


    const handleNew = (TipoAsiento) => {
        const action = {
            type: '[TODO] Add',
            payload: TipoAsiento
        }        
        dispatch(action);
    }

    const handleDelete = (id) => {
        const action = {
            type: '[TODO] Delete',
            payload: id
        }
        dispatch(action);
    }

    return {
        tiposAsientos,             
        handleDelete,
        handleNew
    }

}