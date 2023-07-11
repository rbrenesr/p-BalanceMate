import { useDispatch, useSelector } from 'react-redux';
import Swal from "sweetalert2";
import {
    isLoading,
    isAuth,
    usuario,

    onLoading,
    onAuthenticate,
    onLogout,
} from '../store/authSlice';

export const useAuthStore = () => {

    const dispatch = useDispatch();

    const { isLoading, isAuth, usuario, } = useSelector(state => state.auth);

    const authenticate = (credenciales) => {
        try {

            console.log(credenciales);

            dispatch(onLoading());
            //TODO: * call api authenticate

            if (1 == 1) { //* Si es un usuario válido

                const usuarioValido = {
                    id: 325,
                    nombreUsuario: 'rbrenes',
                    nombre: 'Rafael Brenes',
                    empresaActual: 'balance'
                };

                dispatch(onAuthenticate(usuarioValido));

                (async () => {

                    const { value: empresaSeleccionada } = await Swal.fire({
                        title: 'Selecciones una empresa por favor.',
                        input: 'select',
                        inputOptions: {
                            BalanceMate: 'BalanceMate',
                            Tech: 'Thec',
                            ContaPersonal: 'Conta Personal'
                        },
                        inputPlaceholder: 'Selecciones',
                        allowOutsideClick: false,                        
                        inputValidator: (value) => {
                            return new Promise((resolve) => {

                                console.log(value);

                                if (value !== '') {
                                    resolve()
                                } else {
                                    resolve('Debe seleccionar una empresa por favor.')
                                }
                            })
                        }
                    })
                   
                })()



            } else { //* Si es un usuario no válido
                Swal.fire({
                    title: 'Error de autenticación!',
                    text: `Verifique las credenciales por favor!`,
                    icon: 'warning',
                    confirmButtonText: 'Perfecto'
                });
            }



        } catch (error) {
            Swal.fire({
                title: 'Error de sistema!',
                text: `Proceso presenta un error no controtalo: ! ${error} `,
                icon: 'error',
                confirmButtonText: ':('
            });
        }
    }

    const logout = () => {
        try {
            dispatch(onLoading());
            //TODO: * call api logout

            dispatch(onLogout());

            Swal.fire({
                title: 'Confirmación!',
                text: `Vuelve pronto!`,
                icon: 'success',
                confirmButtonText: 'Perfecto'
            });

        } catch (error) {
            Swal.fire({
                title: 'Error de sistema!',
                text: `Proceso presenta un error no controtalo: ! ${error} `,
                icon: 'error',
                confirmButtonText: ':('
            });
        }
    }

    return {
        isLoading, isAuth, usuario,

        authenticate, logout,
    }
}