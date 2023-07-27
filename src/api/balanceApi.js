import axios from "axios";
import { getEnvVariables } from "../helpers";

const { VITE_API_URL } = getEnvVariables();

const balanceApi = axios.create({
    baseURL: VITE_API_URL,
});

//TODO Configurar intersectores
balanceApi.interceptors.request.use(config => {

    config.headers = {
        ...config.headers,
        'x-token': localStorage.getItem('token')
    }
    return config;
});

export default balanceApi;