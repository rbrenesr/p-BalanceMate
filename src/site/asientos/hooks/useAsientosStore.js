import { useDispatch, useSelector } from 'react-redux';
import Swal from "sweetalert2";
import {
    onLoadAsientos,
    onNewAsiento,
    onEditAsiento,
    onDeleteAsiento,

    onSelectToEditAsientoDetItem,
    onSelectToLoadCopyAsientoDetItem,
    onNewAsientoDetItem,
    onSaveEditedAsientoDetItem,
    onDeleteAsientoDetItem,
} from '../store/asientosSlice';

export const useAsientosStore = () => {

    const dispatch = useDispatch();

    const { asientos, asientosDetItems, asientosDetItemsActiveId, asientosDetItemSelected, asientosDetItemsProccess } = useSelector(state => state.asientos);

    const loadAsientos = () => { dispatch(onLoadAsientos()); };
    const newAsiento = (newAsiento) => { dispatch(onNewAsiento(newAsiento)); };
    const deleteAsiento = (Asiento) => { dispatch(onDeleteAsiento(Asiento)); };
    const editAsiento = (Asiento) => { dispatch(onEditAsiento(Asiento)); };

    const newAsientoDetItem = (asientoDetItem) => {

        try {
            if (asientosDetItemsProccess === 'edit') {
                const objetoConNuevoId = { id: asientosDetItemsActiveId, ...asientoDetItem };
                dispatch(onSaveEditedAsientoDetItem(objetoConNuevoId));
            } else { //new
                const lastId = asientosDetItems.length > 0 ? asientosDetItems[asientosDetItems.length - 1].id : null;
                const nextId = lastId !== null ? (parseInt(lastId) + 1).toString() : "1";
                const objetoConNuevoId = { id: nextId, ...asientoDetItem };
                dispatch(onNewAsientoDetItem(objetoConNuevoId));
            }
            Swal.fire({
                title: 'Confirmación!',
                text: `Proceso aplicado con éxito!`,
                icon: 'success',
                confirmButtonText: 'Perfecto'
            });

        } catch (error) {
            Swal.fire({
                title: 'Error de sistema!',
                text: `Proceso presenta un error no controtalo: ! ${error} `,
                icon: 'error',
                confirmButtonText: ':('
            });
        }       
    };

    const deleteAsientoDetItem = (asientoDetItem) => { dispatch(onDeleteAsientoDetItem(asientoDetItem)); };
    const selectToEditAsientoDetItem = (asientoDetItemId) => { dispatch(onSelectToEditAsientoDetItem(asientoDetItemId)); };
    const selectToLoadCopyAsientoDetItem = (asientoDetItemId) => { dispatch(onSelectToLoadCopyAsientoDetItem(asientoDetItemId)); };


    return {
        //*Propiedades
        asientos,
        asientosDetItems,
        asientosDetItemsActiveId,
        asientosDetItemSelected,
        asientosDetItemsProccess,

        //*Métodos
        loadAsientos,
        newAsiento,
        editAsiento,
        deleteAsiento,

        newAsientoDetItem,
        deleteAsientoDetItem,
        selectToEditAsientoDetItem,
        selectToLoadCopyAsientoDetItem
    }

}