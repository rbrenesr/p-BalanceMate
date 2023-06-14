import { createSlice } from '@reduxjs/toolkit';

export const customerSlice = createSlice({
  name: 'custumers',
  initialState: {
    isModalOpen: false,

    isLoading: false,
    customers: [      
        {
          "id": 1,
          "cedula": "123456789",
          "nombre": "Juan Pérez",
          "email": "juan.perez@example.com",
          "telefono": "555-1234",
          "direccion": "Calle Principal 123",
          "notas": "Cliente regular"
        },
        {
          "id": 2,
          "cedula": "987654321",
          "nombre": "María Gómez",
          "email": "maria.gomez@example.com",
          "telefono": "555-5678",
          "direccion": "Avenida Central 456",
          "notas": "Nuevo cliente"
        },
        {
          "id": 3,
          "cedula": "543216789",
          "nombre": "Pedro Rodríguez",
          "email": "pedro.rodriguez@example.com",
          "telefono": "555-4321",
          "direccion": "Plaza Mayor 789",
          "notas": "Cliente preferente"
        },
        {
          "id": 4,
          "cedula": "987612345",
          "nombre": "Ana López",
          "email": "ana.lopez@example.com",
          "telefono": "555-8765",
          "direccion": "Calle Secundaria 321",
          "notas": "Cliente ocasional"
        },
        {
          "id": 5,
          "cedula": "123459876",
          "nombre": "Luisa Torres",
          "email": "luisa.torres@example.com",
          "telefono": "555-2468",
          "direccion": "Avenida Norte 654",
          "notas": "Cliente regular"
        },
        {
          "id": 6,
          "cedula": "987612349",
          "nombre": "Andrés Sánchez",
          "email": "andres.sanchez@example.com",
          "telefono": "555-9876",
          "direccion": "Calle Terciaria 987",
          "notas": "Cliente preferente"
        },
        {
          "id": 7,
          "cedula": "543216782",
          "nombre": "Carolina Ramos",
          "email": "carolina.ramos@example.com",
          "telefono": "555-7412",
          "direccion": "Avenida Sur 258",
          "notas": "Cliente ocasional"
        },
        {
          "id": 8,
          "cedula": "987623451",
          "nombre": "Miguel Hernández",
          "email": "miguel.hernandez@example.com",
          "telefono": "555-3698",
          "direccion": "Calle Central 789",
          "notas": "Nuevo cliente"
        },
        {
          "id": 9,
          "cedula": "123459875",
          "nombre": "Laura Soto",
          "email": "laura.soto@example.com",
          "telefono": "555-7854",
          "direccion": "Avenida Oeste 357",
          "notas": "Cliente regular"
        },
        {
          "id": 10,
          "cedula": "987623459",
          "nombre": "Roberto Medina",
          "email": "roberto.medina@example.com",
          "telefono": "555-2369",
          "direccion": "Calle Principal 987",
          "notas": "Cliente"
        },
        {
          "id": 11,
          "cedula": "123456789",
          "nombre": "Juan Pérez",
          "email": "juan.perez@example.com",
          "telefono": "555-1234",
          "direccion": "Calle Principal 123",
          "notas": "Cliente regular"
        },
        {
          "id": 12,
          "cedula": "987654321",
          "nombre": "María Gómez",
          "email": "maria.gomez@example.com",
          "telefono": "555-5678",
          "direccion": "Avenida Central 456",
          "notas": "Nuevo cliente"
        },
        {
          "id": 13,
          "cedula": "543216789",
          "nombre": "Pedro Rodríguez",
          "email": "pedro.rodriguez@example.com",
          "telefono": "555-4321",
          "direccion": "Plaza Mayor 789",
          "notas": "Cliente preferente"
        },
        {
          "id": 14,
          "cedula": "987612345",
          "nombre": "Ana López",
          "email": "ana.lopez@example.com",
          "telefono": "555-8765",
          "direccion": "Calle Secundaria 321",
          "notas": "Cliente ocasional"
        },
        {
          "id": 15,
          "cedula": "123459876",
          "nombre": "Luisa Torres",
          "email": "luisa.torres@example.com",
          "telefono": "555-2468",
          "direccion": "Avenida Norte 654",
          "notas": "Cliente regular"
        },      
    ]
  },
  reducers: {

    onOpenModal: (state) => {
      state.isModalOpen = true;
    },
    onCloseModal: (state) => {
      state.isModalOpen = false
    },




    onLoadCustomers: (state, action) => {
      
      state.isLoading = true;
      state.customers = action.payload;
      //state.customers.push(action.payload );
      
    },
    onNewCustomer: (state, action) => {      
      state.isLoading = true;      
      state.customers.push(action.payload );      
    },
    onDeleteCustomer: (state, {payload}) => {                      
        state.customers = state.customers.filter(
           (customer) => customer.id !== payload
         );                    
    },
  }
});

export const {
  onOpenModal,
  onCloseModal,
  onLoadCustomers,
  onNewCustomer,
  onDeleteCustomer
} = customerSlice.actions;