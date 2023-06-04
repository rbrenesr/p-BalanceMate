import { Link, NavLink } from "react-router-dom"

export const NavBar2 = () => {
    return (
        <div className="mb-5 pt-1">
            <nav className="navbar navbar-expand-lg navbar-dark bg-dark fixed-bottom">
                <div className="container-fluid">
                    <a href="#" className="navbar-brand">Navbar</a>
                    
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
                            <li className="nav-item"><a href="#" className="nav-link">Inicio</a></li>

                            
                            <li className="nav-item dropup">
                                <a
                                    href="#"
                                    className="nav-link dropdown-toggle"
                                    role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    id="dropdown-menu"
                                >
                                    Categorias
                                </a>

                                <ul className="dropdown-menu" aria-labelledby="dropdown-menu">
                                    <li><a href="#" className="dropdown-item">Elemento 1</a></li>
                                    <li><a href="#" className="dropdown-item">Elemento 2</a></li>
                                    <li><a href="#" className="dropdown-item">Elemento 3</a></li>
                                </ul>
                            </li>

                            <li className="nav-item"><a href="#" className="nav-link">Blog</a></li>
                            <li className="nav-item"><a href="#" className="nav-link">Contacto</a></li>
                        </ul>

                        <form action="" className="d-flex">
                            <input type="search" className="form-control me-2" placeholder="Buscar" aria-label="Buscar"/>
                                <button className="btn btn-outline-light" type="button">Buscar</button>
                        </form>
                    </div>
                </div>
            </nav>
        </div>

    )
}
