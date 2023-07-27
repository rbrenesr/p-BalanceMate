import { useDispatch, useSelector } from 'react-redux';
import Swal from "sweetalert2";
import { balanceApi } from "../../../api";
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

    const authenticate = async (credenciales) => {

        dispatch(onLoading());

        try {


            const { email, contrasena } = credenciales;

            const { data } = await balanceApi.post('/autenticar', { correo: email, contrasena });
            localStorage.setItem('token', data.token);
            localStorage.setItem('token-init-date', new Date().getTime());

            const usuarioValido = {
                id: data.usuario.id,
                nombre: data.usuario.nombre,
                correo: data.usuario.correo,
            };

            const { data: empresasData } = await balanceApi.get('/autenticar/empresasUsuario');

            const inputOptions = empresasData.empresas.reduce((options, empresa) => {
                options[empresa.baseDatos] = empresa.nombre;
                return options;
            }, {});

            (async () => {

                const { value: empresaSeleccionada } = await Swal.fire({
                    title: 'Selecciones una empresa por favor.',
                    input: 'select',
                    inputOptions: inputOptions,
                    inputPlaceholder: 'Selecciones',
                    allowOutsideClick: false,
                    inputValidator: (value) => {
                        return new Promise((resolve) => {
                            if (value !== '') {
                                usuarioValido.baseDatos = value;                                
                               
                                resolve();
                            } else {
                                resolve('Debe seleccionar una empresa por favor.')
                            }
                        })
                    }
                })

            })().then(async()=>{
                const { data: renewData } = await balanceApi.get(`/autenticar/renovarToken/${usuarioValido.baseDatos}`);
                console.log(renewData)
                localStorage.setItem('token', renewData.token);
                localStorage.setItem('token-init-date', new Date().getTime());    
                dispatch(onAuthenticate(usuarioValido));
            })


        } catch (error) {
            dispatch(onLogout());

            // Error
            if (error.response) {
                // The request was made and the server responded with a status code
                // that falls out of the range of 2xx
                console.log(error.response);
                //  console.log(error.response.status);
                //  console.log(error.response.headers);
            } else if (error.request) {
                // The request was made but no response was received
                // `error.request` is an instance of XMLHttpRequest in the 
                // browser and an instance of
                // http.ClientRequest in node.js
                console.log(error.request);
            } else {
                // Something happened in setting up the request that triggered an Error
                console.log('Error', error.message);
            }
            console.log(error.config);

            // setTimeout(() => {
            //     dispatch(clearErrorMessages());
            // }, 10);

            Swal.fire({
                title: 'Error de autenticación!',
                text: `Verifique las credenciales por favor!`,
                icon: 'warning',
                confirmButtonText: 'Perfecto'
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