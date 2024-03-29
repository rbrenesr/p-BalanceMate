import { Navigate, Route, Routes } from "react-router-dom";

import { MainPage } from '../../main/pages/MainPage';
import { NavBar } from '../../main/components/NavBar'

import { EmpresaPage } from '../../global/empresa/pages/EmpresaPage';
import { ConfiguracionPage } from '../../global/configuracion/pages/ConfiguracionPage';
import { CierrePage } from '../../global/cierrePeriodo/pages/CierrePage';
import { ImportarCatalogo } from "../../global/importarCatalogo/pages/ImportarCatalogo";


import { CatalogoPage } from '../../configuracion/catalogo/pages/CatalogoPage';
import { TipoAsientoPage } from '../../configuracion/tiposAsiento/pages/TipoAsientoPage';

import { ClientesPage } from '../../clientes/pages/ClientesPage';
import { ProveedoresPage } from '../../proveedores/pages/ProveedoresPage';

import { AsientosViewPage } from '../../asientos/pages/AsientosViewPage';
import { AsientosPage } from '../../asientos/pages/AsientosPage';


import { ReportesViewPage } from '../../reportes/pages/ReportesViewPage';

import { FooterPage } from '../../main/components/FooterPage';

import '../styles/MainPage.css'

export const MainRoutes = () => {
  return (
    <>

      <div className="container-fluid px-5 main-routes">
        <NavBar />                
        <Routes>
          <Route path="/" element={<MainPage />} />
          <Route path="/global/empresa" element={<EmpresaPage />} />
          <Route path="/global/configuracion" element={<ConfiguracionPage />} />
          <Route path="/global/cierre" element={<CierrePage />} />
          <Route path="/global/importar" element={<ImportarCatalogo />} />

          <Route path="/configuracion/catalogo" element={<CatalogoPage />} />
          <Route path="/configuracion/tiposAsientos" element={<TipoAsientoPage />} />
          <Route path="/clientes" element={<ClientesPage />} />
          <Route path="/proveedores" element={<ProveedoresPage />} />
          <Route path="/asientosView" element={<AsientosViewPage />} />
          <Route path="/asientos" element={<AsientosPage />} />

          <Route path="/reportes" element={<ReportesViewPage />} />
          
          <Route path="/*" element={<Navigate to="/" />} />
        </Routes> 
        <FooterPage />
      </div>
    </>
  )
}
