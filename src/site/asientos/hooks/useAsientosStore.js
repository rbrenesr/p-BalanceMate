import { useDispatch, useSelector } from 'react-redux';
import {  onLoadAsientos, onNewAsiento, onDeleteAsiento } from '../store/asientosSlice';

export const useAsientosStore = () => {

    const dispatch = useDispatch();
    const { asientos } = useSelector(state => state.asientos);



    const loadAsientos = () => {dispatch(onLoadAsientos());}
    const newAsiento = ( newAsiento ) => {dispatch(onNewAsiento(newAsiento));}
    const deleteAsiento = ( Asiento ) => {dispatch(onDeleteAsiento(Asiento));}

    return {
        //*Propiedades
        asientos,

        //*Métodos
        loadAsientos,
        newAsiento,
        deleteAsiento
    }

}