import { createSlice } from '@reduxjs/toolkit';

//obtener el dia actual
const date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let fechaTemp = `${day}-${month}-${year}`;

const inicialConfiguracion = {
    "fechaInicioPeriodo": fechaTemp,
    "fechaFinPeriodo": fechaTemp,
    "fechaInactividad": fechaTemp,
    "ctaUtilPerdPeriodo": '',    
    "ctaUtilPerdAcumulada": '',    
    "ctaInventarios": '',    
    "ctaCostoVentas": '',    
    "ctaActivoCirculante": '',    
    "ctaPasivoLargoPlazo": '',    
    "ctaActivoTotal": '',    
    "ctaPasivoTotal": '',    
    "ctaCapital": '',    
    "ctaVentas": '',    
};

export const configuracionSlice = createSlice({
    name: 'configuracion',
    initialState: {
        isLoading: false,
        configuracion: inicialConfiguracion,
    },
    reducers: {   
        onLoading:(state, {payload})=>{
            state.isLoading = payload;
        },            
        onSelectConfiguracion: (state, { payload } ) => {    
            console.log(payload);               
            state.configuracion = payload;
        },
        onSaveConfiguracion: (state, { payload }) => {            
            state.configuracion = payload;
        },           
    }
});

export const {
    //propiedades
    isLoading,
    //funciones    
    onLoading,
    onSelectConfiguracion,
    onSaveConfiguracion,

} = configuracionSlice.actions;