import { useDispatch, useSelector } from 'react-redux';
import {  onLoadAsientos, onNewAsiento, onDeleteAsiento } from '../store/asientosSlice';

export const useTiposDeAsientosStore = () => {

    const dispatch = useDispatch();
    const { asientos, tiposDeAsientos } = useSelector(state => state.asientos);
    



    const loadAsientos = () => {dispatch(onLoadAsientos());}
    const newAsiento = ( newAsiento ) => {dispatch(onNewAsiento(newAsiento));}
    const deleteAsiento = ( Asiento ) => {dispatch(onDeleteAsiento(Asiento));}


    const loadTiposDeAsientos = () => {dispatch(onLoadAsientos());}

    return {
        //*Propiedades        
        asientos,
        tiposDeAsientos,

        //*Métodos
        loadTiposDeAsientos,
        loadAsientos,
        newAsiento,
        deleteAsiento
    }

}