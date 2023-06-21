import { createSlice } from '@reduxjs/toolkit';

//obtener el dia actual
const date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let fechaTemp = `${day}-${month}-${year}`;

export const mainSlice = createSlice({
    name: 'main',
    initialState: {
        isLoading: false,        
    },
    reducers: {
        
        onLoading:(state, {payload})=>{
            state.isLoading = payload;
        },
             
    }
});


// Action creators are generated for each case reducer function
export const {
    //propiedades
    isLoading,

    //funciones
    onLoading,

} = mainSlice.actions;