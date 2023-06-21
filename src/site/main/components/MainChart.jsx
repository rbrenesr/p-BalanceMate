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
import { faker } from '@faker-js/faker';



ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend
);

export const MainChart = () => {
  return (
    <div className="table-responsive">
      <table
        id="tableView"
        className="
                    table 
                    table-striped 
                    table-light                     
                    table-sm 
                    table-hove"
        style={{ "width": "100%" }}
      >
        <thead>
          <tr>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td> <Bar
              options={options}
              data={data}
              width={600}
              height={450}
            /></td>
          </tr>
        </tbody>
      </table>
    </div>







  );
}




export const options = {
  responsive: true,
  maintainAspectRatio: false,
  aspectRatio: 2,
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

