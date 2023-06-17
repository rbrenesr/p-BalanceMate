import React, { useEffect, useState } from 'react';
import { useAsientosStore } from '../hooks/useAsientosStore';
import { useForm } from '../../../hooks/useForm';

export const TotalAsiento = () => {

    const numeroAsiento = 'ASE202306-00000';
    const [totalDebe, setTotalDebe] = useState((Math.round(0 * 100) / 100).toFixed(2));
    const [totalHaber, setTotalHaber] = useState((Math.round(0 * 100) / 100).toFixed(2));
    const [diferencia, setDiferencia] = useState((Math.round(0 * 100) / 100).toFixed(2));

    const { asientosDetItems, asientoEncabezado } = useAsientosStore();
    const { formatNumeric } = useForm();

    useEffect(() => { actualizaTotales();}, [asientosDetItems])

    const actualizaTotales = () => {
        const arregloNumerico = asientosDetItems.map(obj => ({
            ...obj,
            debe: parseFloat(obj.debe.replace(',', '')),
            haber: parseFloat(obj.haber.replace(',', '')),
        }));

        const totalDebe = arregloNumerico.reduce((total, obj) => total + obj.debe, 0);
        const totalHaber = arregloNumerico.reduce((total, obj) => total + obj.haber, 0);

        setDiferencia(formatNumeric(totalDebe - totalHaber));
        setTotalDebe(formatNumeric(totalDebe));
        setTotalHaber(formatNumeric(totalHaber));                
    }

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
