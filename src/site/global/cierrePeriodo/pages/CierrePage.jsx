import { useEffect } from "react";
import { LoadingSpinner } from "../../../../components/LoadingSpinner";
import { useForm } from "../../../../hooks/useForm";
import { useCierreStore } from "../hooks/useCierreStore";
import '../styles/CierrePage.css'


export const CierrePage = () => {

  const { isLoading, cierre, closeAccountingPeriod,  } = useCierreStore();



  const onSubmit = (event) => {
    console.log('procesar cierre');
    event.preventDefault();
    closeAccountingPeriod();
  }

  return (
    <div className="fade-in">

      <h2 className="mb-3">Cierre de periodo</h2>

      <form onSubmit={onSubmit}>
        <div className="row d-flex justify-content-around my-3">
          <div className="col"><h3>Cierre</h3></div>
        </div>
        <div className="row d-flex justify-content-around">
          <div className="col">            
          </div>          
        </div>


        <div className="row">
          <div className="col d-flex justify-content-end">
            <button type="submit" className="btn btn-primary">Procesar</button>
          </div>
        </div>
        <br />
        <br />

        {
          isLoading ? <LoadingSpinner /> : '.'
        }

      </form>
    </div>
  )
}
