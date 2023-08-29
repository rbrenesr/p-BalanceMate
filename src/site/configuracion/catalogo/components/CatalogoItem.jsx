import { useCuentaStore } from "../hooks"

export const CatalogoItem = ({ cuenta }) => {

    const { handleDeleteAccount } = useCuentaStore();

    return (
        <>
            <tr>
                <td>{cuenta.id} </td>
                <td>{ cuenta.tipo }</td>
                <td>{ cuenta.descripcion }</td>
                <td>{ cuenta.descripcionUso }</td>
                <td><button className="btn btn-danger" onClick={ id => handleDeleteAccount(cuenta.id) }>x</button></td>
            </tr>
        </>
    )
}
