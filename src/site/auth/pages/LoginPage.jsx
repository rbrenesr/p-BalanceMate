import { useForm } from '../../../hooks';
import { useAuthStore } from '../hooks/useAuthStore';
import('../styles/login.css');



export const LoginPage = () => {
    
    const {
        isLoading, isAuth, usuario,        
        authenticate,logout,
    } =   useAuthStore();

    const { email, contrasena, onInputChange, onResetForm } = useForm(
        {
            email: 'rbrenesr@gmail.com',
            contrasena: '123456'
        }
      );
    
      const onSubmit = (event) => {
        event.preventDefault();        
        authenticate({email, contrasena});
        onResetForm();
      }

    return (
        <div className="container login-container">
            <div className="row d-flex justify-content-center">
                <div className="col-md-6 login-form">
                    <h3>Ingreso</h3>
                    <form onSubmit={onSubmit}>
                        <div className="form-group mb-2">
                            <input
                                type="text"
                                className="form-control"
                                placeholder="Email"                                
                                id="email"
                                name="email"                                
                                autoComplete="off"
                                value={email}
                                onChange={onInputChange}

                            />
                        </div>
                        <div className="form-group mb-2">
                            <input
                                type="password"
                                className="form-control"
                                placeholder="Contraseña"
                                id="contrasena"
                                name="contrasena"                                
                                autoComplete="off"
                                value={contrasena}
                                onChange={onInputChange}
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
                            <a href="#">Recuperar contraseña.</a> 
                        </div>
                    </form>
                </div>
            </div>
        </div>
    )
}