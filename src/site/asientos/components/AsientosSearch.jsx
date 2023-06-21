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
      <form onSubmit={onSubmit}>
        <div className=" row form-group mb-3">
          <div className="col-sm-12 col-md-8 d-flex">
            <input
              type="text"
              className="form-control me-3"
              id="searchText"
              name="searchText"
              placeholder="Buscar..."
              autoComplete="off"
              value={searchText}
              onChange={onInputChange}
            />
             <button type="submit" className="btn btn-outline-primary btn-block customButtom">
              <i className="fas fa-search"></i>
            </button>
          </div>

        </div>
      </form>
    </>
  )
}
