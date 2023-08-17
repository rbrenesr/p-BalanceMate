import { createSlice } from '@reduxjs/toolkit';

//obtener el dia actual
const date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let fechaTemp = `${day}-${month}-${year}`;
const catalogo = [
    {
        id: '0001',        
        tipo: 'ACT',
        descripcion: 'Activo',
        descripcionUso: 'Activo',
    },
    {
        id: '0101',
        tipo: 'ACT',
        descripcion: 'Activo Circulante',
        descripcionUso: 'Activo',
    },
];
const cuentaIncial = {
    id: '',
    cuenta: '',
    tipo: '',
    descripcion: '',
    descripcionUso: '',
}

export const catalogoSlice = createSlice({
    name: 'catalogo',
    initialState: {
        isLoading: false,
        catalogo: catalogo,
        cuentaSelected: cuentaIncial,
    },
    reducers: {
        onLoading: (state) => {
            state.isLoading = true;
        },
        onStopLoading: (state) => {
            state.isLoading = false;
        },
        onGetCatalogo: (state, { payload }) => {
            state.catalogo = payload;
        },
        onGetCuenta: (state, { payload }) => {
            state.cuentaSelected = payload;
        },
        onUpdateCuenta: (state, { payload }) => {
            state.cuentaSelected = payload;
        },
        onDeleteAccount: (state, { payload }) => {
            state.cuentaSelected = payload;


            state.catalogo = state.catalogo.filter(
                (account) => account.id !== payload
              );
              

        },
        onSaveCuenta: (state, { payload }) => {
            console.log(payload);
            state.catalogo.push(payload);
            state.cuentaSelected = payload;
        },
    }
});

export const { onLoading, onStopLoading, onGetCatalogo, onGetCuenta, onUpdateCuenta, onDeleteAccount, onSaveCuenta } = catalogoSlice.actions;