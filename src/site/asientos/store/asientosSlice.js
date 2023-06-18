import { createSlice } from '@reduxjs/toolkit';

const date = new Date();
let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let fechaTemp = `${day}-${month}-${year}`;

const inicialAsientos = [
  {
    "id": "1",
    "numero": "ASE202306-00001",
    "tipoAsiento": "FAC",
    "fecha": fechaTemp,
    "concepto": "Asiento de factura",
    "total": "15,251.25",
    "diferencia": 0,
    "estado": "aplicado",
  },
  {
    "id": "2",
    "numero": "ASE202306-00002",
    "tipoAsiento": "DIA",
    "fecha": fechaTemp,
    "concepto": "Asiento de diario",
    "total": "55,550.00",
    "diferencia": 0,
    "estado": "aplicado",
  },
  {
    "id": "3",
    "numero": "ASE202306-00001",
    "tipoAsiento": "DEP",
    "fecha": fechaTemp,
    "concepto": "Asiento depreciacion",
    "total": "100,000.00",
    "diferencia": 0,
    "estado": "aplicado",
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
const inicialAsientoEncabezado =
{
  "id": "0",
  "numero": "ASE202306-00001",
  "tipoAsiento": "",
  "fecha": fechaTemp,
  "concepto": "",
  "total": 0,
  "diferencia": 0,
  "estado": "aplicado",
};
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
    asientoEncabezado: inicialAsientoEncabezado,
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

      console.log('nrevo asiento');

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
    onFilterAsiento: (state, { payload }) => {

      if (payload.length === 0) {
        state.asientos = inicialAsientos;
      } else {
        state.asientos = state.asientos.filter((asiento) => {
          return (
            asiento.numero.includes(payload) ||
            asiento.tipoAsiento.includes(payload) ||
            asiento.fecha.includes(payload) ||
            asiento.concepto.includes(payload) ||
            asiento.total.includes(payload) ||
            asiento.estado.includes(payload)
          );
        });
      }
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
  onFilterAsiento,

  onLoadTiposDeAsientos,

  onSelectToEditAsientoDetItem,
  onSelectToLoadCopyAsientoDetItem,
  onNewAsientoDetItem,
  onSaveEditedAsientoDetItem,
  onDeleteAsientoDetItem,

} = asientosSlice.actions;