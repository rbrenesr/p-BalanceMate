import { Navigate, Route, Routes } from 'react-router-dom'
import { LoginPage } from '../site/auth';
import { MainRoutes } from '../site/main/router/MainRoutes';


export const AppRouter = () => {
    const authStatus = '-not-authenticated'

    return (

        <Routes>
            {
                (authStatus === 'not-authenticated')
                    ? <Route path='/auth/*' element={<LoginPage />}></Route>
                    : <Route path='/*' element={<MainRoutes />}></Route>
            }
            <Route path='/*' element={<Navigate to="/auth/" />}></Route>
        </Routes>

    )
}
