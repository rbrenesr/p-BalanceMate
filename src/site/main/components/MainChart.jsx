import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend,
  } from 'chart.js';
  import { Bar } from 'react-chartjs-2';
  import {faker} from '@faker-js/faker';

  
ChartJS.register(
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend
  );

export const MainChart = () => {
    return <Bar options={options} data={data} />;
}




export const options = {
  responsive: true,
  plugins: {
    legend: {
      position: 'top',
    },
    title: {
      display: true,
      text: 'Estado de Resultados Comparativo',
    },
  },
};

const labels = ['Enero', 'Febrero', 'Marzo', 'April', 'Mayo', 'Junio', 'Julio'];

export const data = {
  labels,
  datasets: [
    {
      label: '2022',
      data: labels.map(() => faker.datatype.number({ min: 0, max: 100000000 })),      
      backgroundColor: 'rgba(110, 99, 244, 0.8)',
    },
    {
      label: '2023',
      data: labels.map(() => faker.datatype.number({ min: 0, max: 100000000 })),
      backgroundColor: 'rgba(39, 187, 15, 0.8)',
    },
  ],
};

