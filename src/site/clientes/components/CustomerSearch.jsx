import { useForm } from "../../../hooks";



export const CustomerSearch = () => {



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


  return (
    <>
      <form className="container" onSubmit={onSubmit}>
        <div className=" row form-group mb-2">
          <div className="col mb-3">
            <input
              type="text"
              className="form-control"
              id="searchText"
              name="searchText"
              placeholder="Buscar Cliente"
              autoComplete="off"
              value={searchText}
              onChange={onInputChange}
            />
          </div>
          <div className="col mb-3">
            <button type="submit" className="btn btn-outline-primary btn-block">
              <i className="fas fa-search"></i>
            </button>
          </div>
        </div>
      </form>
    </>
  )
}
