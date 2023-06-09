import { useState } from "react";
import { Link, NavLink } from "react-router-dom";
import '../styles/NavBar.css'

export const NavBar = () => {

    const [isNavCollapsed, setIsNavCollapsed] = useState(true);
    const handleNavCollapse = () => setIsNavCollapsed(!isNavCollapsed);

    return (
        <nav className="navbar navbar-expand-lg navbar-dark bg-dark fixed-top text-dark">
            <div className="container-fluid">
                <a href="#" className="navbar-brand">BalanceMate</a>
                <button
                    className="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#menuNav"
                    aria-controls="menuNav"
                    aria-expanded={!isNavCollapsed ? true : false}
                    aria-label="Mostrar / Ocultar Menu"
                    onClick={handleNavCollapse}
                >
                    <span className="navbar-toggler-icon"></span>
                </button>
                <div className={`${isNavCollapsed ? 'collapse' : ''} navbar-collapse`} id="menuNav">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className="nav-item" onClick={handleNavCollapse}><NavLink className="nav-link" to='/' end>Inicio</NavLink></li>
                        <li className="nav-item dropdown">
                            <a
                                href="#"
                                className="nav-link dropdown-toggle"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                id="dropdown-menu-global"
                            >
                                Global
                            </a>
                            <ul className="dropdown-menu" aria-labelledby="dropdown-menu-global">
                                <NavLink onClick={handleNavCollapse} className="dropdown-item" to='/global/empresa' end>Empresa</NavLink>
                                <NavLink onClick={handleNavCollapse} className="dropdown-item" to='/cierre' end>Cierre de Periodo</NavLink>
                                <NavLink onClick={handleNavCollapse} className="dropdown-item" to='/importCatalogo' end>Importar Catálogo</NavLink>
                            </ul>
                        </li>
                        <li className="nav-item dropdown">
                            <a
                                href="#"
                                className="nav-link dropdown-toggle"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                id="dropdown-menu-conf"
                            >
                                Configuración
                            </a>
                            <ul className="dropdown-menu" aria-labelledby="dropdown-menu-conf">
                                <NavLink onClick={handleNavCollapse} className="dropdown-item" to='/configuracion/catalogo' end>Catálogo</NavLink>
                                <NavLink onClick={handleNavCollapse} className="dropdown-item" to='/configuracion/tiposAsientos' end>Tipos de Asientos</NavLink>
                                <NavLink onClick={handleNavCollapse} className="dropdown-item" to='/' end>Tipos de Documentos</NavLink>
                            </ul>
                        </li>
                        <li className="nav-item"><NavLink onClick={handleNavCollapse} className="nav-link" to='/clientes' end>Clientes</NavLink></li>
                        <li className="nav-item"><NavLink onClick={handleNavCollapse} className="nav-link" to='/proveedores' end>Proveedores</NavLink> </li>
                        <li className="nav-item"><NavLink onClick={handleNavCollapse} className="nav-link" to='/asientosView' end>Asientos</NavLink> </li>
                        <li className="nav-item"><NavLink onClick={handleNavCollapse} className="nav-link" to='/' end>Reportes</NavLink> </li>
                        <li className="nav-item"><NavLink onClick={handleNavCollapse} className="nav-link" to='/' end>Salir</NavLink> </li>                       
                    </ul>
                </div>
            </div>
        </nav>


    )
}
