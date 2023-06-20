import { configureStore } from '@reduxjs/toolkit';
import {  customerSlice } from '../site/clientes/store/customerSlice';
import {  asientosSlice } from '../site/asientos/store/asientosSlice';
import {  empresaSlice } from '../site/global/empresa/store/empresaSlice';



export const store = configureStore({
    reducer:{
        empresa: empresaSlice.reducer,
        customers: customerSlice.reducer,    
        asientos: asientosSlice.reducer,            
    },
  
    middleware: ( getDefaultMiddleware ) => getDefaultMiddleware({
        serializableCheck:false
    })
})