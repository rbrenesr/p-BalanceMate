import { createSlice } from '@reduxjs/toolkit';

export const asientosSlice = createSlice({
  name: 'asientos',
  initialState: {
    isLoading: false,
    asientos: [
      {
        "id": 1,
        "docReferencia": "123456789",
        "fecha": "Juan Pérez",
        "concepto": "juan.perez@example.com",
        "monto": "125253.35",
        "estado": "aplicado"
      },
      {
        "id": 2,
        "docReferencia": "123456789",
        "fecha": "Juan Pérez",
        "concepto": "juan.perez@example.com",
        "monto": "125253.35",
        "estado": "aplicado"
      },
      {
        "id": 3,
        "docReferencia": "123456789",
        "fecha": "Juan Pérez",
        "concepto": "juan.perez@example.com",
        "monto": "125253.35",
        "estado": "aplicado"
      },

    ]
  },
  reducers: {
    onLoadAsientos: (state, action) => {

      state.isLoading = true;
      state.asientos = action.payload;
      //state.customers.push(action.payload );

    },

    onNewAsiento: (state, action) => {
      state.isLoading = true;
      state.asientos.push(action.payload);      
    },

    onDeleteAsiento: (state, { payload }) => {
      state.asientos = state.asientos.filter(
        (asiento) => asiento.id !== payload
      );
    },
  }
});

export const { 
  onLoadAsientos,
  onNewAsiento,
  onDeleteAsiento
} = asientosSlice.actions;