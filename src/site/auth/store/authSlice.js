import { createSlice } from '@reduxjs/toolkit';

//obtener el dia actual
const date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let fechaTemp = `${day}-${month}-${year}`;

const inicialUsuario = {
    id:0,
    nombreUsuario: 'rbrenes',            
    nombre: 'Rafael Brenes',
    empresaActual:'balance'
} ;

export const authSlice = createSlice({
    name: 'auth',
    initialState: {
        isLoading: false,
        isAuth: false,
        usuario:inicialUsuario 
    },
    reducers: {
        
        onLoading: (state)=>{
            state.isLoading = true;
        },

        onAuthenticate:( state, { payload } )=>{
            state.isAuth=true;
            state.usuario = payload;
            state.isLoading = false;
        },
             
        onLogout:( state )=>{
            state.isAuth=false;
            state.usuario = inicialUsuario;
            state.isLoading = false;
        }             
    }
});


export const {    
    isLoading, isAuth, usuario, 
    
    onLoading, onAuthenticate, onLogout,
} = authSlice.actions;