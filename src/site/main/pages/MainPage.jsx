import '../styles/MainPage.css'
import logo from '../../../assets/images/bm-screen-image.jpg';
import { MainChart } from '../components/MainChart';


export const MainPage = () => {
  return (
    <div className='fade-in'>

      <div className="row d-flex justify-content-center mb-5">
        <div className="col">
          <h1>BalanceMate</h1>
        </div>
      </div>


      <div className='row'>
        <div className='col'>
          <MainChart />
        </div>
      </div>


      {/* <div className='row d-flex justify-content-center chartCSS'>
        <div className="col-sm-1 col-md-3 p-1"><span>Estado de resultados comparativo</span></div>
        <div className="col-sm-1 col-md-9 p-1">          
          <MainChart />
        </div>
      </div> */}






      {/*       
      <section className='class-section-mainPage'>
        <img className='image' src={logo} alt="MB" />
      </section>
      <div className="wave"></div> */}

      <br />
      <br />
    </div>
  )
}
