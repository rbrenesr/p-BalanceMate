import { Navigate, Route, Routes } from "react-router-dom";

import { MainPage } from '../../main/pages/MainPage';
import { NavBar } from '../../main/components/NavBar'

import { EmpresaPage } from '../../global/empresa/pages/EmpresaPage';

import { CatalogoPage } from '../../configuracion/catalogo/pages/CatalogoPage';
import { ClientesPage } from '../../clientes/pages/ClientesPage';
import { ProveedoresPage } from '../../proveedores/pages/ProveedoresPage';

import { FooterPage } from '../../main/components/FooterPage';

export const MainRoutes = () => {
  return (
    <>

      <div className="container-fluid px-5 main-routes">
        <NavBar />                
        <Routes>
          <Route path="/" element={<MainPage />} />
          <Route path="/global/empresa" element={<EmpresaPage />} />
          <Route path="/configuracion/catalogo" element={<CatalogoPage />} />
          <Route path="/clientes" element={<ClientesPage />} />
          <Route path="/proveedores" element={<ProveedoresPage />} />

          <Route path="/*" element={<Navigate to="/" />} />
        </Routes> 
        <FooterPage />
      </div>
    </>
  )
}
