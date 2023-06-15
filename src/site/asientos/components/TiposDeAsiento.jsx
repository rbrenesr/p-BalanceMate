import React from 'react';
import { useTiposDeAsientosStore } from '../hooks';
import { useForm } from '../../../hooks';


export const TiposDeAsiento = () => {
    const { tiposDeAsientos } = useTiposDeAsientosStore();
    const { tipoDeAsiento, onInputChange, onResetForm } = useForm(
        {
            tipoDeAsiento: ''
        }
      );
    
 
    return (
        <>
            <select
                className="form-select"
                aria-label="Tipos de Asiento"
                id="tipoDeAsiento"
                name="tipoDeAsiento"                                
                defaultValue={tipoDeAsiento}
                onChange={onInputChange}
            >
                {
                    tiposDeAsientos.map(
                        item => (
                            <option key={item.id} value={item.id}>
                                {item.nombre}
                            </option>
                        )
                    )
                }
            </select>
        </>
    )
}


/**
 * 
 * render(){
  return(
    <select value={this.selectedId} onChange={this.dropdownChanged.bind(this)}>
      {option_id.map(id =>
        <option key={id} value={id}>{options[id].name}</option>
      )}
    </select>
  );
}
 */