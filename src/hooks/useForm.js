import { useState } from 'react';

export const useForm = (initialForm = {}) => {

  const [formState, setFormState] = useState(initialForm);

  const onInputChange = ({ target }) => {
    const { name, value } = target;

    setFormState({
      ...formState,
      [name]: value
    })
  };

  const onNumericInputChange = ({ target }) => {
    const { name, value } = target;
    // const numericValue = value.replace(/\D/g, ''); // Remueve todos los caracteres que no sean dígitos
    const numericValue = value.replace(/[^0-9.,]/g, ''); // Remueve todos los caracteres que no sean dígitos

    setFormState({
      ...formState,
      [name]: numericValue
    })
  };

  const onDateChanged = (event, changin) => {
    setFormState({
      ...formState,
      [changin]: event
    });
  };

  const onSelectChange = ({ target }) => {
    const { name, selectedValue, value } = target;
    setFormState({
      ...formState,
      // [value]: value,
      // [selectedValue]: value,
      [name]: value,
    })
  };





  const onNumericInputOnblur = ({ target }) => {
    const { name, value } = target;

    // Formatear el valor numérico con separador de miles y decimales
    const formattedValue = parseFloat(value.replace(',', '.')).toLocaleString('en-US', {
      style: 'decimal',
      maximumFractionDigits: 2,
      minimumFractionDigits: 2,
    });

    setFormState({
      ...formState,
      [name]: formattedValue
    })
  }



  const onResetForm = () => {
    setFormState(initialForm)
  }



  const formatNumeric = (value) => {
    // Formatear el valor numérico con separador de miles y decimales
    const formattedValue = parseFloat(value).toLocaleString('en-US', {
      style: 'decimal',
      maximumFractionDigits: 2,
      minimumFractionDigits: 2,
    });
    return formattedValue;
  }




  return {
    ...formState,
    formState,
    onInputChange,
    onNumericInputChange,
    onNumericInputOnblur,
    onDateChanged,
    onResetForm,
    formatNumeric,
    onSelectChange,
  }
}


/*

const { searchText, onInputChange, onResetForm } = useForm(
    {
      searchText: ''
    }
  );


  const onSubmit = (event) => {
    event.preventDefault(); 
    console.log(searchText);  
    onResetForm();
  }

  type="text"
  className="form-control"
  id="searchText"
  name="searchText"
  placeholder="Buscar Cliente"
  autoComplete="off"
  value={searchText}
  onChange={onInputChange}
  required

  onChange={onNumericInputChange}
  onBlur={onNumericInputOnblur}

  onSubmit={onSubmit}


*/



/**
 * 

const handleChange = (event) => {
  const inputValue = event.target.value;
  const numericValue = inputValue.replace(/[^0-9.,]/g, ''); // Remueve todos los caracteres que no sean números, puntos o comas

  // Formatear el valor numérico con separador de miles y decimales
  const formattedValue = parseFloat(numericValue.replace(',', '.')).toLocaleString('en-US', {
    style: 'decimal',
    maximumFractionDigits: 2,
    minimumFractionDigits: 2,
  });

  setValue(formattedValue);
};


 * 
 */