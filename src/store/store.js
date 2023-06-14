import { configureStore } from '@reduxjs/toolkit';
import {  customerSlice } from '../site/clientes/store/customerSlice';


export const store = configureStore({
    reducer:{
        customers: customerSlice.reducer,        
    },
    middleware: ( getDefaultMiddleware ) => getDefaultMiddleware({
        serializableCheck:false
    })
})