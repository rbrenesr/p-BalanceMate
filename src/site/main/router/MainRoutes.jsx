import { Navigate, Route, Routes } from "react-router-dom";
import {MainPage} from '../../main/pages/MainPage';
import {NavBar} from '../../main/components/NavBar'

import {ClientesPage} from '../../clientes/pages/ClientesPage';
import {EmpresaPage} from '../../empresa/pages/EmpresaPage';

export const MainRoutes = () => {
  return (
    <>
    <NavBar/>
    
    <Routes>
        <Route path="/" element={ <MainPage /> } />
        <Route path="/clientes" element={ <ClientesPage /> } />
        <Route path="/empresa" element={ <EmpresaPage /> } />

        <Route path="/*" element={ <Navigate to="/" /> } />
    </Routes>
    </>
  )
}
