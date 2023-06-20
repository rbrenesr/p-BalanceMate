import '../styles/MainPage.css'
import logo from '../../../assets/images/bm-screen-image.jpg';
import { MainChart } from '../components/MainChart';


export const MainPage = () => {
  return (
    <div className='fade-in'>

      <header className="row d-flex justify-content-center mb-5">
        <div className="col">
          <h1>BalanceMate</h1>
        </div>
      </header>
      {/* <div className="container"> */}
      
        <div className='chartCSS'>
          <MainChart />
        </div>
      
      {/* </div> */}
      {/*       
      <section className='class-section-mainPage'>
        <img className='image' src={logo} alt="MB" />
      </section>
      <div className="wave"></div> */}
    </div>
  )
}
