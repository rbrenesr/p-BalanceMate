import React from 'react'

export const TotalAsiento = () => {

    const numeroAsiento = 'ASE202306-00000';
    const totalDebe = (Math.round(0 * 100) / 100).toFixed(2);
    const totalHaber = (Math.round(0 * 100) / 100).toFixed(2);
    const diferencia = (Math.round(0 * 100) / 100).toFixed(2);

    return (
        <div className='totalesCSS'>
            <div className="row">
                <div className="col-md-12">
                    <span className='totales-spanCSS'>{numeroAsiento}</span>
                </div>
            </div>
            <div className="row">
                <div className="col-md-6">
                    <span className='totales-spanCSS'>Total Debe:</span>
                </div>
                <div className="col-md-6">
                    <span className='totales-spanCSS'>Total Haber:</span>
                </div>
            </div>
            <div className="row">
                <div className="col-md-6">
                    <span className='totales-spanCSS'>{totalDebe}</span>
                </div>
                <div className="col-md-6">
                    <span className='totales-spanCSS'>{totalHaber}</span>
                </div>
            </div>
            <div className="row">
                <div className="col-md-6">
                    <span className='totalesDif-spanCSS'>Diferencia:</span>
                </div>
                <div className="col-md-6">
                    <span className='totalesDif-spanCSS'>{diferencia}</span>
                </div>
            </div>
        </div>
    )
}
