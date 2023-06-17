import { createSlice } from '@reduxjs/toolkit';

const inicialAsientos = [
  {
    "id": 1,
    "numero": "ASI202303-0055",
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

];
const incialTiposDeAsiento = [
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
];
const inicialAsientosDetItems = [
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
    "cuenta": "1-02-0001-0002",
    "descripcion": "activo fijo",
    "observaciones": "observaciones",
    "tDocumento": "DEP",
    "nDocumentor": "564654",
    "tercero": "",
    "debe": "0.00",
    "haber": "16,000.00",
  },
];
const inicialAsientosDetItemSelected = {
  "id": "",
  "cuenta": "",
  "descripcion": "",
  "observaciones": "",
  "tDocumento": "",
  "nDocumentor": "",
  "tercero": "",
  "debe": "0.00",
  "haber": "0.00",
};
const inicialAsientosDetItemsActiveId = '';
const inicialAsientosDetItemsProccess = '';


export const asientosSlice = createSlice({
  name: 'asientos',
  initialState: {
    isLoading: false,
    asientos: inicialAsientos,
    tiposDeAsientos: incialTiposDeAsiento,
    asientosDetItems: inicialAsientosDetItems,
    asientosDetItemSelected: inicialAsientosDetItemSelected,
    asientosDetItemsActiveId: inicialAsientosDetItemsActiveId,
    asientosDetItemsProccess: inicialAsientosDetItemsProccess,

  },
  reducers: {

    onLoadAsientos: (state, action) => {
      state.asientos = action.payload;
    },
    onNewAsiento: (state, action) => {
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
      state.tiposDeAsientos = action.payload;
    },



    onSelectToEditAsientoDetItem: (state, { payload }) => {
      state.asientosDetItemsActiveId = payload;
      state.asientosDetItemSelected = state.asientosDetItems.find(item => item.id === payload);
      state.asientosDetItemsProccess = 'edit';
    },
    onSelectToLoadCopyAsientoDetItem: (state, { payload }) => {
      state.asientosDetItemsActiveId = payload;
      state.asientosDetItemSelected = state.asientosDetItems.find(item => item.id === payload);
      state.asientosDetItemsProccess = 'new';
    },



    onNewAsientoDetItem: (state, action) => {
      state.asientosDetItems.push(action.payload);
      state.asientosDetItemSelected =
      {
        "id": "",
        "cuenta": "",
        "descripcion": "",
        "observaciones": "",
        "tDocumento": "",
        "nDocumentor": "",
        "tercero": "",
        "debe": "0.00",
        "haber": "0.00",
      };
      state.asientosDetItemsActiveId = '';
      state.asientosDetItemsProccess = '';      
    },
    onSaveEditedAsientoDetItem: (state, { payload }) => {    
      const arregloActualizado = state.asientosDetItems.map(objeto => {
        if (objeto.id === payload.id) {
          return payload;
        }
        return objeto;
      });

      state.asientosDetItems = arregloActualizado;

      state.asientosDetItemsActiveId = '';
      state.asientosDetItemsProccess = '';
      state.asientosDetItemSelected =
      {
        "id": "",
        "cuenta": "",
        "descripcion": "",
        "observaciones": "",
        "tDocumento": "",
        "nDocumentor": "",
        "tercero": "",
        "debe": "0.00",
        "haber": "0.00",
      };

    },
    onDeleteAsientoDetItem: (state, { payload }) => {
      state.asientosDetItems = state.asientosDetItems.filter(
        (asiento) => asiento.id !== payload
      );
    },
  }
});

export const {
  onLoadAsientos,
  onNewAsiento,
  onEditAsiento,
  onDeleteAsiento,

  onLoadTiposDeAsientos,

  onSelectToEditAsientoDetItem,
  onSelectToLoadCopyAsientoDetItem,
  onNewAsientoDetItem,
  onSaveEditedAsientoDetItem,
  onDeleteAsientoDetItem,

} = asientosSlice.actions;