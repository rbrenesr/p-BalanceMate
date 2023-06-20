import { createSlice } from '@reduxjs/toolkit';

//obtener el dia actual
const date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let fechaTemp = `${day}-${month}-${year}`;

const inicialEmrpesa = {
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
        empresa: inicialEmrpesa,
    },
    reducers: {
        onSelectEmpresa: (state, { payload }) => {
            console.log('onLoadEmpresa');
            state.empresa = payload;
        },
        onSaveEmpresa: (state, { payload }) => {
            console.log('onSaveEmpresa');
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
    
    onSelectEmpresaonLoadEmpresa,
    onSaveEmpresaonLoadEmpresa,
    onUpdateEmpresaonLoadEmpresa,

} = empresaSlice.actions;