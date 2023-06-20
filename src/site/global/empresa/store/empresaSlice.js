import { createSlice } from '@reduxjs/toolkit';

//obtener el dia actual
const date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let fechaTemp = `${day}-${month}-${year}`;

const inicialEmpresa = {
    "id": 0,
    "codigo": 'EMP01',
    "nombre": 'BalanceMate',
    "cedula": '304140227',
    "email": 'balancemate@balance.com',
    "telefonoI": '+506 1234-1234',
    "telefonoII": '+506 1234-1234',
    "paginaWeb": 'https://www.balancemate.com',
    "repLegalNombre": 'Rafael Brenes',
    "repLegalCedula": '304140227',
    "repLegalTelefono": '+506 8329-0634',
    "repLegalEmail": 'rbrenesr@gmail.com',
};

export const empresaSlice = createSlice({
    name: 'empresa',
    initialState: {
        isLoading: false,
        empresa: inicialEmpresa,
    },
    reducers: {
        onSelectEmpresa: (state, { payload }) => {
            console.log('onLoadEmpresa');
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
    
    onSelectEmpresa,
    onSaveEmpresa,
    onUpdateEmpresa,

} = empresaSlice.actions;