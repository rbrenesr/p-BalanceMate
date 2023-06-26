import { configureStore } from '@reduxjs/toolkit';
import {  customerSlice } from '../site/clientes/store/customerSlice';
import {  asientosSlice } from '../site/asientos/store/asientosSlice';

import { empresaSlice } from '../site/global/empresa/store/empresaSlice';
import { configuracionSlice } from '../site/global/configuracion/store/configuracionSlice';
import { cierreSlice } from '../site/global/cierrePeriodo/store/cierreSlice';

import { mainSlice } from '../site/main/store/mainSlice';


export const store = configureStore({
    reducer:{
        main: mainSlice.reducer,
        empresa: empresaSlice.reducer,
        configuracion: configuracionSlice.reducer,
        cierre: cierreSlice.reducer,
        customers: customerSlice.reducer,    
        asientos: asientosSlice.reducer,            
    },
  
    middleware: ( getDefaultMiddleware ) => getDefaultMiddleware({
        serializableCheck:false
    })
})