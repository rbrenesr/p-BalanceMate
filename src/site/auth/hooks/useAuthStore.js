import { useDispatch, useSelector } from 'react-redux';
import Swal from "sweetalert2";
import { balanceApi } from "../../../api";
import { useEmpresaStore } from '../../global/empresa/hooks/useEmpresaStore';
import {
    isLoading, isAuth, usuario,

    onLoading, onAuthenticate, onLogout,
} from '../store/authSlice';


export const useAuthStore = () => {

    const dispatch = useDispatch();
    const { selectEmpresa } = useEmpresaStore();

    const { isLoading, isAuth, usuario, } = useSelector(state => state.auth);

    const authenticate = async (credenciales) => {

        dispatch(onLoading());

        try {

            const { email, contrasena } = credenciales;
            const { data } = await balanceApi.post('/autenticar', { correo: email, contrasena });
            localStorage.setItem('token', data.token);
            localStorage.setItem('token-init-date', new Date().getTime());
            localStorage.setItem('user', '');

            const usuarioValido = {
                id: data.usuario.id,
                nombre: data.usuario.nombre,
                correo: data.usuario.correo,
                db: data.usuario.db,
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
                                usuarioValido.db = value;

                                resolve();
                            } else {
                                resolve('Debe seleccionar una empresa por favor.')
                            }
                        })
                    }
                })

            })().then(async () => {

                
                const { data: renewData } = await balanceApi.get(`/autenticar/renovarToken/${usuarioValido.db}`);
                localStorage.setItem('token', renewData.token);
                localStorage.setItem('token-init-date', new Date().getTime());
                localStorage.setItem('user', JSON.stringify(usuarioValido));

                dispatch(onAuthenticate(usuarioValido));

                await selectEmpresa(usuarioValido.db);
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


            localStorage.clear();
            

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

    const checkAuthToken = async () => {

        const token = localStorage.getItem('token');
        const userStorage = localStorage.getItem('user');   
        const user = JSON.parse(userStorage);

        if (!token || !user) {
            dispatch(onLogout());
            return;
        }

        try {
            const { data } = await balanceApi.get('autenticar/renovarToken');
            localStorage.setItem('token', data.token);
            localStorage.setItem('token-init-date', new Date().getTime());
            dispatch(onAuthenticate(user));

            //TODO:
            //* Eliminar esta carga de este punto, trasladarla a load del formulario de empresa.
            await selectEmpresa(user.db);

        } catch (error) {
            localStorage.clear();
            dispatch(onLogout());
        }

    }


    return {
        isLoading, isAuth, usuario,

        authenticate, logout, checkAuthToken,
    }
}