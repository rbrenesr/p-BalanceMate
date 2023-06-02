import('../../styles/LoginPage.css')

export const LoginPage = () => {
    return (
        <div className="container login-container">
            <div className="row d-flex justify-content-center">
                <div className="col-md-6 login-form">
                    <h3>Ingreso</h3>
                    <form>
                        <div className="form-group mb-2">
                            <input
                                type="text"
                                className="form-control"
                                placeholder="Correo"
                            />
                        </div>
                        <div className="form-group mb-2">
                            <input
                                type="password"
                                className="form-control"
                                placeholder="Contraseña"
                            />
                        </div>
                        <div className="form-group mb-2">
                            <input
                                type="submit"
                                className="btnSubmit"
                                value="Login"
                            />
                        </div>
                        <div className="text-center fs-6">
                            <a href="#">Forget password?</a> or <a href="#">Sign up</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    )
}