import { useState } from 'react';

export const useForm = (initialForm = {}) => {

    const [formState, setFormState] = useState(initialForm);

    const onInputChange = ({ target }) => {
        const { name, value } = target;

        setFormState({
            ...formState,
            [name]: value
        })
    }

    const onResetForm = () => {
        setFormState(initialForm)
    }

    return {
        ...formState,
        formState,
        onInputChange,
        onResetForm
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

  onSubmit={onSubmit}


*/