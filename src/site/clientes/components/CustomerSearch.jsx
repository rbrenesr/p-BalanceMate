
export const CustomerSearch = () => {

  const onSubmit = (event) => {
    event.preventDefault();
  }

  return (
    <>
      <form className="container" onSubmit={onSubmit}>
        <div className=" row form-group mb-2">
          <div className="col mb-3">
            <input type="text" className="form-control" id="buscar" name="buscar" placeholder="Buscar Cliente" />           
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
