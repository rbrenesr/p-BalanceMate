import { configureStore } from '@reduxjs/toolkit';
import { customerSlice } from '../site/clientes/store/customerSlice';
import { asientosSlice } from '../site/asientos/store/asientosSlice';

import { empresaSlice } from '../site/global/empresa/store/empresaSlice';
import { configuracionSlice } from '../site/global/configuracion/store/configuracionSlice';
import { cierreSlice } from '../site/global/cierrePeriodo/store/cierreSlice';
import { importarSlice } from '../site/global/importarCatalogo/store/importarSlice';

import { catalogoSlice } from '../site/configuracion/catalogo/store'

import { mainSlice } from '../site/main/store/mainSlice';
import { authSlice } from '../site/auth/store/authSlice';



export const store = configureStore({
    reducer:{
        auth: authSlice.reducer,
        
        main: mainSlice.reducer,
        
        empresa: empresaSlice.reducer,
        
        configuracion: configuracionSlice.reducer,
        cierre: cierreSlice.reducer,
        importar: importarSlice.reducer,
        
        catalogo: catalogoSlice.reducer,

        customers: customerSlice.reducer,

        asientos: asientosSlice.reducer,            
    },
  
    middleware: ( getDefaultMiddleware ) => getDefaultMiddleware({
        serializableCheck:false
    })
})