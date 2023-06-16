import { useDispatch, useSelector } from 'react-redux';
import {
    onLoadAsientos,
    onNewAsiento,
    onEditAsiento,
    onDeleteAsiento,

    onLoadTiposDeAsientos,

    onLoadAsientosDetItems,
    onNewAsientoDetItem,
    onDeleteAsientoDetItem,
    onEditAsientoDetItem,
} from '../store/asientosSlice';

export const useAsientosStore = () => {

    const dispatch = useDispatch();
    const { asientos, asientosDetItems, asientosDetItemsSelectId } = useSelector(state => state.asientos);



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
    
    const deleteAsientoDetItem = (asientoDetItem) => { dispatch(onDeleteAsientoDetItem(asientoDetItem)); };
    const editAsientoDetItem = (asientoDetItem) => { dispatch(onEditAsientoDetItem(asientoDetItem)); };
    const loadAsientoDetItem = () => { dispatch(onDeleteAsientoDetItem(asientosDetItemsSelectId)); };
    
    

    return {
        //*Propiedades
        asientos,
        asientosDetItems,
        asientosDetItemsSelectId,

        //*Métodos
        loadAsientos,
        newAsiento,
        editAsiento,
        deleteAsiento,

        newAsientoDetItem,
        deleteAsientoDetItem,
        editAsientoDetItem,
        loadAsientoDetItem,
    }

}