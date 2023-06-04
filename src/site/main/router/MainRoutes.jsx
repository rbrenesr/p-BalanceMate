import { Navigate, Route, Routes } from "react-router-dom";

import {MainPage} from '../../main/pages/MainPage';
import {NavBar} from '../../main/components/NavBar'
import {NavBar2} from '../../main/components/NavBar2'

import {ClientesPage} from '../../clientes/pages/ClientesPage';
import {ProveedoresPage} from '../../proveedores/pages/ProveedoresPage';
import {EmpresaPage} from '../../empresa/pages/EmpresaPage';

export const MainRoutes = () => {
  return (
    <>
    <NavBar/>
    
    <Routes>
        <Route path="/" element={ <MainPage /> } />
        <Route path="/clientes" element={ <ClientesPage /> } />
        <Route path="/empresa" element={ <EmpresaPage /> } />
        <Route path="/proveedores" element={ <ProveedoresPage /> } />

        <Route path="/*" element={ <Navigate to="/" /> } />
    </Routes> 
    </>
  )
}
