import { Link, NavLink } from "react-router-dom"

export const NavBar = () => {
    return (
        <nav className="navbar navbar-expand-lg navbar-dark bg-dark fixed-top px-4">
            <div className="container-fluid">
                <a href="#" className="navbar-brand">BalanceMate</a>


                <button
                    className="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#menu"
                    aria-controls="menu"
                    aria-expanded="false"
                    aria-label="Mostrar / Ocultar Menu"
                >
                    <span className="navbar-toggler-icon"></span>
                </button>


                <div className="collapse navbar-collapse" id="menu">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">

                        <NavLink className="nav-link" to='/' end>Inicio</NavLink>

                        
                        <li className="nav-item dropdown">
                            <a
                                href="#"
                                className="nav-link dropdown-toggle"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                id="dropdown-menu"
                            >
                                Global
                            </a>

                            <ul className="dropdown-menu" aria-labelledby="dropdown-menu">
                                <li><a href="#" className="dropdown-item">Empresa</a></li>
                                <li><a href="#" className="dropdown-item">Cierre Periodo</a></li>
                                <li><a href="#" className="dropdown-item">Importar Catálogo</a></li>
                            </ul>
                        </li>

                        <li className="nav-item dropdown">
                            <a
                                href="#"
                                className="nav-link dropdown-toggle"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                id="dropdown-menu"
                            >
                                Configuración
                            </a>

                            <ul className="dropdown-menu" aria-labelledby="dropdown-menu">
                                <li><a href="#" className="dropdown-item">Catálogo</a></li>
                                <li><a href="#" className="dropdown-item">Tipos de Asiento</a></li>
                                <li><a href="#" className="dropdown-item">Tipos de Documentos</a></li>
                            </ul>
                        </li>


                        <NavLink className="nav-link" to='/' end>Clientes</NavLink>
                        <NavLink className="nav-link" to='/' end>Proveedores</NavLink>
                        <NavLink className="nav-link" to='/' end>Asientos</NavLink>
                        <NavLink className="nav-link" to='/' end>Reportes</NavLink>
                        <NavLink className="nav-link" to='/' end>Salir</NavLink>



                        {/* <button className="btn btn-outline-danger">
                                <i className="fas fa-sign-out-alt"></i>
                                <span>Salir</span>
                            </button> */}

                    </ul>

                    {/* <form action="" className="d-flex">
                            <input type="search" className="form-control me-2" placeholder="Buscar" aria-label="Buscar">
                                <button className="btn btn-outline-light" type="button">Buscar</button>
                        </form> */}
                </div>
            </div>
        </nav>
    )
}
