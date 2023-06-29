import { createSlice } from "@reduxjs/toolkit";

const date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let fechaTemp = `${day}-${month}-${year}`;

const inicialEmpresas = [
    {
        'id': 1,
        'nombre': 'ServiSoft',
    },
    {
        'id': 2,
        'nombre': 'TeraByte',
    },
    {
        'id': 3,
        'nombre': 'AppSoft',
    },
];

export const importarSlice = createSlice({
    name: 'importar',
    initialState: {
        isLoading: false,
        empresas: inicialEmpresas,
    },
    reducers: {
        onLoad: (state) => {
            state.isLoading = true;
        },

        onGetEmpresas: (state, { payload }) => {
            state.empresas = payload;
        }
    }
});


export const {
    isLoading,

    onLoad,
    onGetEmpresas,
} = importarSlice.actions;
