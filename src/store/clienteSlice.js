import { createSlice } from '@reduxjs/toolkit';

export const clienteSlice = createSlice({
   name: 'cliente',
   initialState: {
        isModalOpen: false
   },
   reducers: {
    onOpenModal: (state, /* action */ ) => {
        state.isModalOpen = true;
     },
     onCloseModal: (state) => {
       state.isModalOpen = false
     }
   }
});


// Action creators are generated for each case reducer function
export const { onOpenModal,onCloseModal  } = clienteSlice.actions;