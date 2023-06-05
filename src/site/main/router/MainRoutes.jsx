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

      <div className="container-fluid px-5" style={{ maxHeight: 'calc(100vh - 120px)', maxWidth: '100%', overflowY: 'auto' }}>

        <NavBar />
        <EmpresaPage />
        <FooterPage />

        {/*<Routes>
          <Route path="/" element={<MainPage />} />
          <Route path="/clientes" element={<ClientesPage />} />
          <Route path="/empresa" element={<EmpresaPage />} />
          <Route path="/proveedores" element={<ProveedoresPage />} />

          <Route path="/*" element={<Navigate to="/" />} />
        </Routes> */}

      </div>



      {/* 
      <div className="container">
        <div className="row">
          <div className="col"><NavBar /></div>
        </div>

        <div className="row">
          <div className="col">
            <EmpresaPage />
          </div>
        </div>

        <div className="row">
          <div className="col"><FooterPage /></div>
        </div> */}






      {/* </div> */}
    </>
  )
}
