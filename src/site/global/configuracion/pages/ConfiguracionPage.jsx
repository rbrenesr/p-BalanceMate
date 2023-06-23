import { useEffect } from "react";
import { LoadingSpinner } from "../../../../components/LoadingSpinner";
import { useForm } from "../../../../hooks/useForm";
import { useConfiguracionStore } from "../hooks/useConfiguracionStore";
import '../styles/ConfiguracionPage.css'


export const ConfiguracionPage = () => {

  const { isLoading, configuracion, selectConfiguracion, saveConfiguracion, } = useConfiguracionStore();

  useEffect(() => {
    selectConfiguracion();
    setFormState(configuracion);
  }, [])

  const {
    fechaInicioPeriodo
    , fechaFinPeriodo
    , fechaInactividad
    , ctaUtilPerdPeriodo
    , ctaUtilPerdAcumulada
    , ctaInventarios
    , ctaCostoVentas
    , ctaActivoCirculante
    , ctaPasivoLargoPlazo
    , ctaActivoTotal
    , ctaPasivoTotal
    , ctaCapital

    , onInputChange
    , setFormState
  } = useForm(
    {
      ...configuracion,
    }
  );

  const onSubmit = (event) => {
    event.preventDefault();
    console.log(
      {
        fechaInicioPeriodo
        , fechaFinPeriodo
        , fechaInactividad
        , ctaUtilPerdPeriodo
        , ctaUtilPerdAcumulada
        , ctaInventarios
        , ctaCostoVentas
        , ctaActivoCirculante
        , ctaPasivoLargoPlazo
        , ctaActivoTotal
        , ctaPasivoTotal
        , ctaCapital
      }
    );

    saveConfiguracion(
      {
        fechaInicioPeriodo
        , fechaFinPeriodo
        , fechaInactividad
        , ctaUtilPerdPeriodo
        , ctaUtilPerdAcumulada
        , ctaInventarios
        , ctaCostoVentas
        , ctaActivoCirculante
        , ctaPasivoLargoPlazo
        , ctaActivoTotal
        , ctaPasivoTotal
        , ctaCapital
      }
    );
  }

  return (
    <div className="fade-in">

      <h2 className="mb-3">Configuraciones</h2>

      <form onSubmit={onSubmit}>

        <div className="row mb-4">
          <div className="col-sm-2 col-md-3">
            <label htmlFor="fechaInicioPeriodo">Fecha Inicio de Periodo</label>

            <div className="d-flex">
              <input type="text" className="form-control" name="fechaInicioPeriodo" value={fechaInicioPeriodo} onChange={onInputChange} id="fechaInicioPeriodo" required />
              <button type="submit" className="btn btn-outline-primary btn-block ms-2">
                <i className="fas fa-search"></i>
              </button>
            </div>
          </div>
          <div className="col-sm-2 col-md-3">
            <label htmlFor="fechaFinPeriodo">Fecha Fin de Periodo</label>
            <div className="d-flex">
              <input type="text" className="form-control" name="fechaFinPeriodo" value={fechaFinPeriodo} onChange={onInputChange} id="fechaFinPeriodo" required />
              <button type="submit" className="btn btn-outline-primary btn-block ms-2">
                <i className="fas fa-search"></i>
              </button>
            </div>
          </div>
          <div className="col-sm-2 col-md-3">
            <label htmlFor="fechaInactividad">Fecha Inactividad</label>
            <div className="d-flex">
              <input type="text" className="form-control" name="fechaInactividad" onChange={onInputChange} id="fechaInactividad" required />
              <button type="submit" className="btn btn-outline-primary btn-block ms-2">
                <i className="fas fa-search"></i>
              </button>
            </div>
          </div>
          <div className="col-sm-2 col-md-3">
            <label htmlFor="ctaCapital">Cta Capital</label>
            <input type="text" className="form-control" name="ctaCapital" value={ctaCapital} onChange={onInputChange} id="ctaCapital" required />
          </div>

        </div>

        <div className="row mb-4">
          <div className="col-sm-2 col-md-3">
            <label htmlFor="ctaUtilPerdPeriodo">Cta Util/Perd del Periodo</label>
            <input type="text" className="form-control" name="ctaUtilPerdPeriodo" value={ctaUtilPerdPeriodo} onChange={onInputChange} id="ctaUtilPerdPeriodo" required />
          </div>
          <div className="col-sm-2 col-md-3">
            <label htmlFor="ctaUtilPerdAcumulada">Cta Util/Perd Acumulada</label>
            <input type="text" className="form-control" name="ctaUtilPerdAcumulada" value={ctaUtilPerdAcumulada} onChange={onInputChange} id="ctaUtilPerdAcumulada" required />
          </div>
          <div className="col-sm-2 col-md-3">
            <label htmlFor="ctaInventarios">Cta Inventarios</label>
            <input type="text" className="form-control" name="ctaInventarios" value={ctaInventarios} onChange={onInputChange} id="ctaInventarios" required />
          </div>
          <div className="col-sm-2 col-md-3">
            <label htmlFor="ctaCostoVentas">Cta Costo de Ventas</label>
            <input type="text" className="form-control" name="ctaCostoVentas" value={ctaCostoVentas} onChange={onInputChange} id="ctaCostoVentas" required />
          </div>
        </div>


        <div className="row mb-4">
          <div className="col-sm-2 col-md-3">
            <label htmlFor="ctaActivoCirculante">Cta Activo Circulante</label>
            <input type="text" className="form-control" name="ctaActivoCirculante" value={ctaActivoCirculante} onChange={onInputChange} id="ctaActivoCirculante" required />
          </div>
          <div className="col-sm-2 col-md-3">
            <label htmlFor="ctaPasivoLargoPlazo">Cta Pasivo Largo Plazo</label>
            <input type="text" className="form-control" name="ctaPasivoLargoPlazo}" value={ctaPasivoLargoPlazo} onChange={onInputChange} id="ctaPasivoLargoPlazo" required />
          </div>
          <div className="col-sm-2 col-md-3">
            <label htmlFor="ctaActivoTotal">Cta Activo Total</label>
            <input type="text" className="form-control" name="ctaActivoTotal" value={ctaActivoTotal} onChange={onInputChange} id="ctaActivoTotal" required />
          </div>
          <div className="col-sm-2 col-md-3">
            <label htmlFor="ctaPasivoTotal">Cta Pasivo Total</label>
            <input type="text" className="form-control" name="ctaPasivoTotal" value={ctaPasivoTotal} onChange={onInputChange} id="ctaPasivoTotal" required />
          </div>
        </div>

        <button className="btn btn-primary" type="submit">Procesar</button>

        <br />
        <br />

      </form>

    </div>
  )
}
