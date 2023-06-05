import { Navigate, Route, Routes } from "react-router-dom";

import { MainPage } from '../../main/pages/MainPage';
import { NavBar } from '../../main/components/NavBar'

import { ClientesPage } from '../../clientes/pages/ClientesPage';
import { ProveedoresPage } from '../../proveedores/pages/ProveedoresPage';
import { EmpresaPage } from '../../empresa/pages/EmpresaPage';
import { FooterPage } from '../../main/components/FooterPage';

export const MainRoutes = () => {
  return (
    <>

      <div className="container-fluid px-5 main-routes">
        <NavBar />                
        <Routes>
          <Route path="/" element={<MainPage />} />
          <Route path="/clientes" element={<ClientesPage />} />
          <Route path="/empresa" element={<EmpresaPage />} />
          <Route path="/proveedores" element={<ProveedoresPage />} />

          <Route path="/*" element={<Navigate to="/" />} />
        </Routes> 
        <FooterPage />
      </div>
    </>
  )
}
