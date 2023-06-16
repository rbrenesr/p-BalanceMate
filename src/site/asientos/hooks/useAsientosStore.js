import { useDispatch, useSelector } from 'react-redux';
import {
    onLoadAsientos,
    onNewAsiento,
    onEditAsiento,
    onDeleteAsiento,

    onLoadTiposDeAsientos,

    onLoadAsientosDetItems,
    onNewAsientoDetItem,
} from '../store/asientosSlice';

export const useAsientosStore = () => {

    const dispatch = useDispatch();
    const { asientos, asientosDetItems } = useSelector(state => state.asientos);



    const loadAsientos = () => { dispatch(onLoadAsientos()); };
    const newAsiento = (newAsiento) => { dispatch(onNewAsiento(newAsiento)); };
    const deleteAsiento = (Asiento) => { dispatch(onDeleteAsiento(Asiento)); };
    const editAsiento = (Asiento) => { dispatch(onEditAsiento(Asiento)); };

    const newAsientoDetItem = (asientoDetItem) => {

        const lastId = asientosDetItems.length > 0 ? asientosDetItems[asientosDetItems.length - 1].id : null;        
        const nextId = lastId !== null ? (parseInt(lastId) + 1).toString() : "1";
        const objetoConNuevoId = {id: nextId, ...asientoDetItem};        

        dispatch(onNewAsientoDetItem(objetoConNuevoId));
    };

    return {
        //*Propiedades
        asientos,
        asientosDetItems,

        //*Métodos
        loadAsientos,
        newAsiento,
        editAsiento,
        deleteAsiento,

        newAsientoDetItem,
    }

}