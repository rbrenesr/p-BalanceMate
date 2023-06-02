import { Navigate, Route, Routes } from 'react-router-dom'
import { LoginPage } from '../auth';
import { MainPage } from '../main/MainPage';


export const AppRouter = () => {
    const authStatus = 'authenticated'

    return (

        <Routes>
            {
                (authStatus === 'not-authenticated')
                    ? <Route path='/auth/*' element={<LoginPage />}></Route>
                    : <Route path='/*' element={<MainPage />}></Route>
            }
            <Route path='/*' element={<Navigate to="/auth/pages/login" />}></Route>
        </Routes>

    )
}
