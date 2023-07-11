import { useEffect } from "react";
import { LoadingSpinner } from "../../../../components/LoadingSpinner";
import { useForm } from "../../../../hooks/useForm";
import { useCierreStore } from "../hooks/useCierreStore";
import '../styles/CierrePage.css'


export const CierrePage = () => {

  const { isLoading, cierre, closeAccountingPeriod, } = useCierreStore();
  console.log(isLoading);


  const onBackup = (event) => {
    console.log('procesar backup');
    event.preventDefault();
    closeAccountingPeriod();
  }


  const onSubmit = (event) => {
    console.log('procesar cierre');
    event.preventDefault();
    closeAccountingPeriod();
  }

  return (
    <div className="fade-in">

      <h2 className="mb-3">Cierre de periodo</h2>

      <form>
        <div className="row">
          <div className="col-sm-12 d-flex justify-content-center">
            <div className="card bg-light mb-3" style={{ 'maxWidth': '35rem' }}>
              <div className="card-header">Ejecutar proceos de cierre</div>
              <div className="card-body">
                <h5 className="card-title">¿Qué realiza este proceso?</h5>
                <p className="card-text">Esta acción ejecutará el proceso de cierre fiscal anual.</p>
                <p>BalanceMate guardará una copia de sus datos para consultas antes del cierre, con el sufijo del año en que finaliza el periodo ejem: Demo_2005 y además dejará la empresa con nuevos saldos iniciales y sin asientos para procesar el nuevo periodo fiscal, para lo cual debe configurar su fecha de inicio y fin de periodo.</p>
                <p>Es importante hacer un respaldo antes de correr este proceso.</p>
              </div>
            </div>
          </div>
        </div>

        <div className="row d-flex justify-content-center">
          <div className="col-sm-12 col-md-3 d-flex justify-content-center">
            <button type="submit" className="btn btn-warning m-2" style={{ 'width': '15rem' }} onClick={onBackup}>Generar Respaldo</button>
          </div>
          <div className="col-sm-12 col-md-3 d-flex justify-content-center">
            <button type="submit" className="btn btn-primary m-2" style={{ 'width': '15rem' }} onClick={onSubmit}>Procesar</button>
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
