
export const CatalogoItem = ({ cuenta, handleDeleteCuenta }) => {

    return (
        <>
            <tr>
                <td>{cuenta.id} </td>
                <td>{ cuenta.description }</td>
                <td><button className="btn btn-danger" onClick={ id => handleDeleteCuenta(cuenta.id) }>x</button></td>
            </tr>
        </>
    )
    //   return (
    //     <>
    //         <li 
    //           key={cuenta.id} 
    //           className="list-group-item d-flex justify-content-between"          
    //         >
    //             <span 
    //               className={`align-self-center ${ (cuenta.done) ? 'text-decoration-line-through': '' }`}
    //               aria-label="span"

    //             >
    //               { cuenta.description }
    //             </span>
    //             <button className="btn btn-danger" onClick={ id => handleDeleteCuenta(cuenta.id) }>x</button>
    //         </li>
    //     </>
    //   )
}
