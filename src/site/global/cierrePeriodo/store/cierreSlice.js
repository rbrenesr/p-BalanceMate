import { createSlice } from '@reduxjs/toolkit';

//obtener el dia actual
const date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let fechaTemp = `${day}-${month}-${year}`;


export const cierreSlice = createSlice({
    name: 'cierre',
    initialState: {
        isLoading: false,        
    },
    reducers: {
        
        onLoading:(state, {payload})=>{
            state.isLoading = payload;
        },
        
        onClosingAccountingPeriod: (state, { payload }) => {       
            console.log('onClosingAccountingPeriod');     
            state.empresa = payload;
        },
              
    }
});


// Action creators are generated for each case reducer function
export const {
    //propiedades
    isLoading,

    //funciones
    onLoading,
    onClosingAccountingPeriod,

} = cierreSlice.actions;