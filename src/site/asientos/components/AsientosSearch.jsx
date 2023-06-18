import { useForm } from "../../../hooks";
import { useAsientosStore } from "../hooks/useAsientosStore";

export const AsientosSearch = () => {
  
  const { filterAsiento } = useAsientosStore();

  const { searchText, onInputChange } = useForm(
    {
      searchText: ''
    }
  );

  const onSubmit = (event) => {
    event.preventDefault();         
    filterAsiento(searchText);
    document.getElementById("searchText").focus();
    document.getElementById("searchText").select();
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
              placeholder="Buscar..."
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
