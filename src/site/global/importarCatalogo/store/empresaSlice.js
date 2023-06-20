import { createSlice } from '@reduxjs/toolkit';

//obtener el dia actual
const date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let fechaTemp = `${day}-${month}-${year}`;

const inicialEmpresa = {
    "id": 0,
    "codigo": '',
    "nombre": '',
    "cedula": '',
    "email": '',
    "telefonoI": '',
    "telefonoII": '',
    "paginaWeb": '',
    "repLegalNombre": '',
    "repLegalCedula": '',
    "repLegalTelefono": '',
    "repLegalEmail": '',
};

export const empresaSlice = createSlice({
    name: 'empresa',
    initialState: {
        isLoading: false,
        empresa: inicialEmpresa,
    },
    reducers: {
        
        onLoading:(state, {payload})=>{
            state.isLoading = payload;
        },
        
        onSelectEmpresa: (state, { payload } ) => {                   
            state.empresa = payload;
        },
        onSaveEmpresa: (state, { payload }) => {
            console.log(payload);
            state.empresa = payload;
        },
        onUpdateEmpresa: (state, { payload }) => {
            if (state.empresa === payload.id) {
                state.empresa = payload;
            }
        },        
    }
});


// Action creators are generated for each case reducer function
export const {
    //propiedades
    isLoading,

    //funciones
    onLoading,
    onSelectEmpresa,
    onSaveEmpresa,
    onUpdateEmpresa,

} = empresaSlice.actions;