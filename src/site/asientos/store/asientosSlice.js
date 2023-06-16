import { createSlice } from '@reduxjs/toolkit';

export const asientosSlice = createSlice({
  name: 'asientos',
  initialState: {
    isLoading: false,
    asientos: [
      {
        "id": 1,
        "numero": "ASI202303-0000",
        "fecha": "2023-01-01",
        "concepto": "Asiento de diario, actualización de registros.",
        "totalDebe": "1.000,000.00",
        "totalHaber": "1.000,000.00",
        "estado": "aplicado"
      },
      {
        "id": 2,
        "numero": "ASI202303-0000",
        "fecha": "2023-01-01",
        "concepto": "Asiento de diario, actualización de registros.",
        "totalDebe": "1.000,000.00",
        "totalHaber": "1.000,000.00",
        "estado": "aplicado"
      },
      {
        "id": 3,
        "numero": "ASI202303-0000",
        "fecha": "2023-01-01",
        "concepto": "Asiento de diario, actualización de registros.",
        "totalDebe": "1.000,000.00",
        "totalHaber": "1.000,000.00",
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
    asientosDetItems: [
      {
        "id": "1",
        "cuenta": "1-01-0001-0001",
        "descripcion": "activo fijo",
        "observaciones": "observaciones",
        "tDocumento": "DEP",
        "nDocumentor": "564654",
        "tercero": "",
        "debe": "15,000.00",
        "haber": "0.00",
      },
      {
        "id": "2",
        "cuenta": "1-01-0001-0001",
        "descripcion": "activo fijo",
        "observaciones": "observaciones",
        "tDocumento": "DEP",
        "nDocumentor": "564654",
        "tercero": "",
        "debe": "0.00",
        "haber": "16,000.00",
      },
    ],
    asientosDetItemsSelectId: '',
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

    onEditAsiento: (state, { payload }) => {
      state.asientos = state.asientos.filter(
        (asiento) => asiento.id !== payload
      );
    },

    onDeleteAsiento: (state, { payload }) => {
      state.asientos = state.asientos.filter(
        (asiento) => asiento.id !== payload
      );
    },






    onLoadTiposDeAsientos: (state, action) => {
      state.isLoading = true;
      state.tiposDeAsientos = action.payload;
      //state.customers.push(action.payload );
    },






    onLoadAsientosDetItems: (state, action) => {
      state.isLoading = true;
      state.asientosDetItems = action.payload;
      //state.customers.push(action.payload );
    },
    onNewAsientoDetItem: (state, action) => {
      state.isLoading = true;
      state.asientosDetItems.push(action.payload);
    },
    onDeleteAsientoDetItem: (state, { payload }) => {
      state.asientosDetItems = state.asientosDetItems.filter(
        (asiento) => asiento.id !== payload
      );
    },

    onEditAsientoDetItem: (state, { payload }) => {
      state.asientosDetItemsSelectId = payload;
    },


    


  }
});

export const {
  onLoadAsientos,
  onNewAsiento,
  onEditAsiento,
  onDeleteAsiento,
  
  onLoadTiposDeAsientos,
  
  onLoadAsientosDetItems,
  onNewAsientoDetItem,
  onDeleteAsientoDetItem,
  onEditAsientoDetItem,

} = asientosSlice.actions;