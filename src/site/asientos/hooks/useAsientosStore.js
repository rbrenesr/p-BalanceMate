import { useDispatch, useSelector } from 'react-redux';
import {
    onLoadAsientos,
    onNewAsiento,
    onEditAsiento,
    onDeleteAsiento,

    onLoadTiposDeAsientos,

    onLoadAsientosDetItem,
    onNewAsientoDetItem,
    onDeleteAsientoDetItem,
    onEditAsientoDetItem,
    onSaveEditedAsientoDetItem
} from '../store/asientosSlice';

export const useAsientosStore = () => {

    const dispatch = useDispatch();
    const { asientos, asientosDetItems, asientosDetItemsActiveId, asientosDetItemSelected } = useSelector(state => state.asientos);



    const loadAsientos = () => { dispatch(onLoadAsientos()); };
    const newAsiento = (newAsiento) => { dispatch(onNewAsiento(newAsiento)); };
    const deleteAsiento = (Asiento) => { dispatch(onDeleteAsiento(Asiento)); };
    const editAsiento = (Asiento) => { dispatch(onEditAsiento(Asiento)); };

    const newAsientoDetItem = (asientoDetItem) => {


        console.log(asientosDetItemsActiveId);

        if (asientosDetItemsActiveId !== '') {
            console.log('es actualziar');
            const objetoConNuevoId = { id: asientosDetItemsActiveId, ...asientoDetItem };
            dispatch(onSaveEditedAsientoDetItem(objetoConNuevoId));
        } else {
            
            console.log('nuevo');
            const lastId = asientosDetItems.length > 0 ? asientosDetItems[asientosDetItems.length - 1].id : null;
            const nextId = lastId !== null ? (parseInt(lastId) + 1).toString() : "1";
            const objetoConNuevoId = { id: nextId, ...asientoDetItem };
    
            dispatch(onNewAsientoDetItem(objetoConNuevoId));
        }



    };

    const deleteAsientoDetItem = (asientoDetItem) => { dispatch(onDeleteAsientoDetItem(asientoDetItem)); };
    const editAsientoDetItem = (asientoDetItemId) => { dispatch(onLoadAsientosDetItem(asientoDetItemId)); };


    return {
        //*Propiedades
        asientos,
        asientosDetItems,
        asientosDetItemsActiveId,
        asientosDetItemSelected,

        //*Métodos
        loadAsientos,
        newAsiento,
        editAsiento,
        deleteAsiento,

        newAsientoDetItem,
        deleteAsientoDetItem,
        editAsientoDetItem,

    }

}