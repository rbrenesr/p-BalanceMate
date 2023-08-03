import { Navigate, Route, Routes } from 'react-router-dom'
import { LoginPage } from '../site/auth';
import { MainRoutes } from '../site/main/router/MainRoutes';
import { useAuthStore } from '../site/auth/hooks/useAuthStore';
import { useEffect } from 'react';


export const AppRouter = () => {

    const {
        isLoading, isAuth, usuario,        
        authenticate,logout, checkAuthToken
    } =   useAuthStore();



    useEffect(() => {
        checkAuthToken();
      }, [])
        
    
    return (

        <Routes>
            {
                (!isAuth)
                    ? <Route path='/auth/*' element={<LoginPage />}></Route>
                    : <Route path='/*' element={<MainRoutes />}></Route>
            }
            <Route path='/*' element={<Navigate to="/auth/" />}></Route>
        </Routes>

    )
}
