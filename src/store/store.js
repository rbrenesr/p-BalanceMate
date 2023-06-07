import { configureStore } from '@reduxjs/toolkit';
import {  clienteSlice } from './';


export const store = configureStore({
    reducer:{
        cliente: clienteSlice.reducer,        
    },
    middleware: ( getDefaultMiddleware ) => getDefaultMiddleware({
        serializableCheck:false
    })
})