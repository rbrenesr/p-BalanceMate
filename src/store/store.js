import { configureStore } from '@reduxjs/toolkit';
import {  customerSlice } from '../site/clientes/store/customerSlice';
import {  asientosSlice } from '../site/asientos/store/asientosSlice';


export const store = configureStore({
    reducer:{
        customers: customerSlice.reducer,    
        asientos: asientosSlice.reducer,            
    },
  
    middleware: ( getDefaultMiddleware ) => getDefaultMiddleware({
        serializableCheck:false
    })
})