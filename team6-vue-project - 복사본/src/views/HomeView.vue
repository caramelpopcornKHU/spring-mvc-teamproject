<template>
  <div class="pc-layout">
    <div class="content-wrapper">
      <div class="hero-card">
        <h5 class="card-title">Spring Boot vs Node.js – Traffic Performance Test</h5>
        <p class="card-text">동일 조건에서 트래픽 처리 속도 비교</p>
      </div>

      <div class="test-results-grid">
        <div class="spring-block">
          <div class="btn-group" style="right: 280px;">
            <button class="btn btn-test1">Spring</button>
          </div>
          <div class="chart-card card-graph">
            <h5 class="chart-title">트래픽 처리 속도 비교</h5>
            <div class="chart-body">
              <Line :data="lineData" :options="lineOptions" />
            </div>
          </div>
        </div>

        <div class="ubiaccess-block" >
          <div class="btn-group" style="right: 870px;">
            <button class="btn btn-test2">Ubiaccess</button>
          </div>
          <div class="chart-card card-bar">
            <h5 class="chart-title">평균 응답 시간</h5>
            <div class="chart-body">
              <Bar :data="barData" :options="barOptions" />
            </div>
            <div class="stats-row" >
        <div class="card-small">
          <h6>Average Time</h6>
          <p>120 ms</p>
        </div>
        <div class="card-small">
          <h6>Success Rate</h6>
          <p>98%</p>
        </div>
      </div>
          </div>
        </div>
      </div>

      
    </div>
  </div>
</template>

<script>
import { Line, Bar } from 'vue-chartjs';
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  LineElement,
  BarElement,
  LinearScale,
  PointElement,
  CategoryScale
} from 'chart.js';

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  LineElement,
  BarElement,
  LinearScale,
  PointElement,
  CategoryScale
);

export default {
  name: 'TrafficTestView',
  components: { Line, Bar },
  data() {
    return {
      lineData: {
        labels: [100, 200, 300, 400, 500],
        datasets: [
          {
            label: 'Spring Boot',
            data: [30, 60, 110, 150, 190],
            borderColor: '#00ff4c',
            backgroundColor: 'rgba(0, 255, 76, 0.2)',
            fill: true,
            tension: 0.3
          },
          {
            label: 'Node.js',
            data: [25, 55, 95, 140, 175],
            borderColor: '#f2ff00',
            backgroundColor: 'rgba(242, 255, 0, 0.2)',
            fill: true,
            tension: 0.3
          }
        ]
      },
      lineOptions: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true,
            title: { display: true, text: 'Response Time (ms)', color: '#95ff95' },
            ticks: { color: '#95ff95' }
          },
          x: {
            title: { display: true, text: 'Number of Requests', color: '#95ff95' },
            ticks: { color: '#95ff95' }
          }
        },
        plugins: {
          legend: { labels: { color: '#95ff95' } },
          title: { display: false }
        }
      },
      barData: {
        labels: ['Spring Boot', 'Node.js'],
        datasets: [
          {
            label: 'Average Response Time (ms)',
            data: [120, 95],
            backgroundColor: ['#00ff4c', '#f2ff00']
          }
        ]
      },
      barOptions: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: { display: false },
          title: { display: false }
        },
        scales: {
          y: {
            beginAtZero: true,
            title: { display: true, text: 'Response Time (ms)', color: '#95ff95' },
            ticks: { color: '#95ff95' }
          },
          x: { ticks: { color: '#95ff95' } }
        }
      }
    };
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
* { box-sizing: border-box; font-family: 'Inter', sans-serif; margin:0; padding:0; }

.pc-layout {
  width: 100vw;
  min-height: 100vh;
  background-color: #0d0d0d;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  padding: 2vh 1vw;
  color: #fff;
}

.content-wrapper {
  width: 95%;
  max-width: 1920px;
  display: grid;
  grid-template-rows: auto auto 1fr auto;
  row-gap: 24px;
}

/* 헤더 카드 */
.hero-card {
  background: #1a1a1a;
  border-radius: 1rem;
  padding: 1.5rem 2rem;
  text-align: center;
  box-shadow: 0 0.25rem 1rem rgba(0,0,0,0.5);
}
.card-title { font-size: 1.5rem; font-weight: 700; color: #e0e0e0; }
.card-text  { font-size: 1rem; color: #b3b3b3; }

.test-results-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 24px;
  margin-top: 24px;
}

/* Spring과 Ubiaccess 블록 스타일 */
.spring-block {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24px;
}

.ubiaccess-block {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24px;
}

.btn-test1 {
  width: 50%;
  padding: 1.5rem 1.5rem;
  border-radius: 1rem;
  border: none;
  font-weight: 700;
  font-size: 1.25rem;
  cursor: pointer;
  color: #000;
  transition: background-color 0.2s;
}
.btn-test2 {
  width: 50%;
  padding: 1.5rem 1.5rem;
  border-radius: 1rem;
  border: none;
  font-weight: 700;
  font-size: 1.25rem;
  cursor: pointer;
  color: #000;
  transition: background-color 0.2s;
}
.btn:hover { background-color: #555; }
.btn-test1 { background-color: #00ff4c; }
.btn-test2 { background-color: #f2ff00; }

/* 차트 카드 스타일 */
.chart-card {
  width: 100%;
  border-radius: 1rem;
  box-shadow: 0 0.25rem 0.75rem rgba(0,0,0,0.5);
  padding: 1rem;
  display: flex;
  flex-direction: column;
}
.chart-body { flex: 1; height: 100%; }
.chart-title {
  color: #95ff95;
  font-size: 1.2rem;
  margin-bottom: 1rem;
  text-align: center;
}
.card-graph { background-color: #121212; height: 500px; }
.card-bar { background-color: #1a1a1a;  height: 500px;}

/* 하단 상태 카드 */
.stats-row {
  display: flex;
  justify-content: flex-end;
  gap: 24px;
  margin-top: 24px;

}
.card-small {
  background-color: #2a2a2a;
  border-radius: 1rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  padding: 1rem 1.5rem;
  height: 100px;
  box-shadow: 0 0.25rem 0.75rem rgba(0,0,0,0.45);
  width: 350px;
}
.card-small h6 { margin: 0.3rem 0; font-size: 1rem; color: #dcdcdc; }
.card-small p  { margin: 0; font-weight: 700; font-size: 1.1rem; color: #fff; }

/* 반응형 */
@media (max-width: 1100px) {
  .test-results-grid { grid-template-columns: 1fr; }
  .stats-row { justify-content: center; }
}
</style>