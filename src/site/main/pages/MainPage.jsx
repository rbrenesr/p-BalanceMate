import '../styles/MainPage.css'

export const MainPage = () => {
  return (
    <>
      <header className="row d-flex justify-content-center mb-5">
        <div className="col">
          <h1>BalanceMate</h1>
        </div>
      </header>
      <section className='class-section-mainPage'>
        <img className='image' src="../../../../public/bm-screen-image.jpg" alt="MB" />
      </section>
      <div className="wave"></div>
    </>
  )
}
