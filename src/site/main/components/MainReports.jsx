
export const MainReports = () => {
    return (
        <>
            <div className="grey-bg container-fluid">
                <section id="minimal-statistics">
                    <div className="row">
                        <div className="col-12 mt-3 mb-4">
                            <h4 className="text-uppercase">Estadísticas generales</h4>
                            {/* <p>Estadísticas generales</p> */}
                        </div>
                    </div>
                    <div className="row mb-4">
                        <div className="col-sm-6 col-xl-3 mb-2">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="align-self-center">
                                                <i className="icon-pencil primary font-large-2 float-left"></i>
                                            </div>
                                            <div className="media-body text-right">
                                                <h3>25</h3>
                                                <span>Asientos hoy!</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-sm-6 col-xl-3 mb-2">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="align-self-center">
                                                <i className="icon-speech warning font-large-2 float-left"></i>
                                            </div>
                                            <div className="media-body text-right">
                                                <h3>156</h3>
                                                <span>Asientos de la semana</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-sm-6 col-xl-3 mb-2">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="align-self-center">
                                                <i className="icon-graph success font-large-2 float-left"></i>
                                            </div>
                                            <div className="media-body text-right">
                                                <h3>64</h3>
                                                <span>N° de clientes</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-sm-6 col-xl-3 mb-2">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="align-self-center">
                                                {/* <i className="icon-pointer danger font-large-2 float-left"></i> */}
                                                <i className="icon-graph success font-large-2 float-left"></i>
                                            </div>
                                            <div className="media-body text-right">
                                                <h3>23</h3>
                                                <span>N° Proveedores</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* <div className="row mb-4">
                        <div className="col-xl-3 col-sm-6 col-12">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="media-body text-left">
                                                <h3 className="danger">278</h3>
                                                <span>New Projects</span>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="icon-rocket danger font-large-2 float-right"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-xl-3 col-sm-6 col-12">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="media-body text-left">
                                                <h3 className="success">156</h3>
                                                <span>New Clients</span>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="icon-user success font-large-2 float-right"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div className="col-xl-3 col-sm-6 col-12">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="media-body text-left">
                                                <h3 className="warning">64.89 %</h3>
                                                <span>Conversion Rate</span>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="icon-pie-chart warning font-large-2 float-right"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-xl-3 col-sm-6 col-12">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="media-body text-left">
                                                <h3 className="primary">423</h3>
                                                <span>Support Tickets</span>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="icon-support primary font-large-2 float-right"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="row">
                        <div className="col-xl-3 col-sm-6 col-12">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="media-body text-left">
                                                <h3 className="primary">278</h3>
                                                <span>New Posts</span>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="icon-book-open primary font-large-2 float-right"></i>
                                            </div>
                                        </div>
                                        <div className="progress mt-1 mb-0" style={{"height": "7px"}}>
                                            <div className="progress-bar bg-primary" role="progressbar" style={{"width": "80%"}} aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-xl-3 col-sm-6 col-12">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="media-body text-left">
                                                <h3 className="warning">156</h3>
                                                <span>New Comments</span>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="icon-bubbles warning font-large-2 float-right"></i>
                                            </div>
                                        </div>
                                        <div className="progress mt-1 mb-0" style={{"height": "7px"}}>
                                            <div className="progress-bar bg-warning" role="progressbar" style={{"width": "35%"}} aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div className="col-xl-3 col-sm-6 col-12">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="media-body text-left">
                                                <h3 className="success">64.89 %</h3>
                                                <span>Bounce Rate</span>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="icon-cup success font-large-2 float-right"></i>
                                            </div>
                                        </div>
                                        <div className="progress mt-1 mb-0" style={{"height": "7px"}}>
                                            <div className="progress-bar bg-success" role="progressbar" style={{"width": "60%"}} aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-xl-3 col-sm-6 col-12">
                            <div className="card">
                                <div className="card-content">
                                    <div className="card-body">
                                        <div className="media d-flex">
                                            <div className="media-body text-left">
                                                <h3 className="danger">423</h3>
                                                <span>Total Visits</span>
                                            </div>
                                            <div className="align-self-center">
                                                <i className="icon-direction danger font-large-2 float-right"></i>
                                            </div>
                                        </div>
                                        <div className="progress mt-1 mb-0" style={{"height": "7px"}}>
                                            <div className="progress-bar bg-danger" role="progressbar" style={{"width": "40%"}} aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> */}
                </section>

                <section id="stats-subtitle">
                    <div className="row">
                        <div className="col-12 mt-5 mb-4">
                            <h4 className="text-uppercase">Estado de cuentas global a la fecha actual</h4>
                            {/* <p>Estado de cuentas global a la fecha actual</p> */}
                        </div>
                    </div>

                    <div className="row mb-5">
                        <div className="col-sm-12 col-md-4">
                            <div className="card overflow-hidden">
                                <div className="card-content bg-primary text-white">
                                    <div className="card-body cleartfix">
                                        <div className="media align-items-stretch">
                                            <div className="align-self-center">
                                                <i className="icon-pencil primary font-large-2 mr-2"></i>
                                            </div>
                                            <div className="media-body">
                                                <h4>Activos</h4>
                                                <span>Junio 2023</span>
                                            </div>
                                            <div className="align-self-center">
                                                <h1>18,552,500.00</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div className="col-sm-12 col-md-4">
                            <div className="card">
                                <div className="card-content bg-secondary text-white">
                                    <div className="card-body cleartfix">
                                        <div className="media align-items-stretch">
                                            <div className="align-self-center">
                                            <i className="icon-pencil primary font-large-2 mr-2"></i>
                                            </div>
                                            <div className="media-body">
                                                <h4>Pasivos</h4>
                                                <span>Junio 2023</span>
                                            </div>
                                            <div className="align-self-center">
                                                <h1>84,695</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div className="col-sm-12 col-md-4">
                            <div className="card">
                                <div className="card-content bg-success text-white">
                                    <div className="card-body cleartfix">
                                        <div className="media align-items-stretch">
                                            <div className="align-self-center">
                                            <i className="icon-pencil primary font-large-2 mr-2"></i>
                                            </div>
                                            <div className="media-body">
                                                <h4>Patrimonio</h4>
                                                <span>Junio 2023</span>
                                            </div>
                                            <div className="align-self-center">
                                                <h1>84,695</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div className="row mb-5">
                        <div className="col-sm-12 col-md-4">
                            <div className="card overflow-hidden">
                                <div className="card-content bg-light text-dark">
                                    <div className="card-body cleartfix">
                                        <div className="media align-items-stretch">
                                            <div className="align-self-center">
                                                <i className="icon-pencil primary font-large-2 mr-2"></i>
                                            </div>
                                            <div className="media-body">
                                                <h4>Ingresos</h4>
                                                <span>Junio 2023</span>
                                            </div>
                                            <div className="align-self-center">
                                                <h1>18,552,500.00</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div className="col-sm-12 col-md-4">
                            <div className="card">
                                <div className="card-content bg-warning text-white">
                                    <div className="card-body cleartfix">
                                        <div className="media align-items-stretch">
                                            <div className="align-self-center">
                                            <i className="icon-pencil primary font-large-2 mr-2"></i>
                                            </div>
                                            <div className="media-body">
                                                <h4>Costos</h4>
                                                <span>Junio 2023</span>
                                            </div>
                                            <div className="align-self-center">
                                                <h1>84,695</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div className="col-sm-12 col-md-4">
                            <div className="card">
                                <div className="card-content bg-danger text-white">
                                    <div className="card-body cleartfix">
                                        <div className="media align-items-stretch">
                                            <div className="align-self-center">
                                            <i className="icon-pencil primary font-large-2 mr-2"></i>
                                            </div>
                                            <div className="media-body">
                                                <h4>Gastos</h4>
                                                <span>Junio 2023</span>
                                            </div>
                                            <div className="align-self-center">
                                                <h1>84,695</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                   
                </section>
            </div>
        </>
    )
}
