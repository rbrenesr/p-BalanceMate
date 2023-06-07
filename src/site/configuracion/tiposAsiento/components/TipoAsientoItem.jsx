
export const TipoAsientoItem = ({ tipoAsiento, handleDelete }) => {

    return (
        <>
            <tr>                
                <td>{ tipoAsiento.codigo }</td>
                <td>{ tipoAsiento.descripcion }</td>
                <td><button className="btn btn-danger" onClick={ id => handleDelete(tipoAsiento.id) }>x</button></td>
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
