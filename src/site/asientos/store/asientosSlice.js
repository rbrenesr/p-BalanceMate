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

    ],
    tiposDeAsientos: [
      {
        "id": "0",
        "nombre": "Tipos de Asiento",
      },
      {
        "id": "1",
        "nombre": "Diario",
      },
      {
        "id": "2",
        "nombre": "Diferencial",
      },
    ],
  },
  reducers: {
    onLoadAsientos: (state, action) => {

      state.isLoading = true;
      state.asientos = action.payload;
      //state.customers.push(action.payload );

    },

    onLoadTiposDeAsientos: (state, action) => {

      state.isLoading = true;
      state.tiposDeAsientos = action.payload;
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
  onLoadTiposDeAsientos,

  onNewAsiento,
  onDeleteAsiento
} = asientosSlice.actions;