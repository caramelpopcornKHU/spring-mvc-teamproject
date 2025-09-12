<template>
  <div class="pc-layout">
    <div class="content-wrapper">
      <div class="row g-4">
        <!-- 메인 카드 -->
        <div class="col-md-4">
          <div class="card text-center p-5">
            <h5 class="card-title">트래픽 처리 속도 시나리오1</h5>
            <p class="card-text">트래픽 처리 속도 시나리오</p>
          </div>

          <!-- Spring 카드 -->
          <div class="typecard text-center card-spring">
            <h5>Spring</h5>
          </div>

          <!-- Ubiaccess 카드 -->
          <div class="typecard text-center card-ubiaccess">
            <h5>Ubiaccess</h5>
          </div>

          <!-- Graph 카드 (트래픽 비교용) -->
          <div class="typecard text-center card-graph">
            <h5>트래픽 처리 속도 비교</h5>
            <Line
              :data="chartData"
              :options="chartOptions"
              style="height:200px; width:100%;"
            />
          </div>

          <!-- Bar 차트 카드 추가 -->
          <div class="typecard text-center card-bar">
            <h5>실패율 비교</h5>
            <Bar
              :data="barData"
              :options="barOptions"
              style="height:200px; width:100%;"
            />
          </div>

          <div class="status-container">
            <!-- 아래쪽 카드 2개 -->
            <div class="card-bottom">
              <div class="card-small">
                <h6>실패율</h6>
                <p>2%</p>
              </div>
              <div class="card-small">
                <h6>Rate</h6>
                <p>50 req/s</p>
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
  name: 'HomeView',
  components: { Line, Bar },
  data() {
    return {
      chartData: {
        labels: ['0ms', '50ms', '100ms', '150ms', '200ms', '250ms'], 
        datasets: [
          {
            label: 'Spring Boot',
            data: [50, 80, 120, 180, 220, 250],
            borderColor: '#00ff4c',
            backgroundColor: 'rgba(0, 255, 76, 0.2)',
            fill: true,
            tension: 0.3
          },
          {
            label: 'UbiAccess',
            data: [60, 90, 150, 210, 260, 300],
            borderColor: '#f2ff00',
            backgroundColor: 'rgba(242, 255, 0, 0.2)',
            fill: true,
            tension: 0.3
          }
        ]
      },
      chartOptions: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true,
            title: { display: true, text: '처리 시간 (ms)', color: '#95ff95' },
            ticks: { color: '#95ff95' }
          },
          x: {
            title: { display: true, text: '동시 요청률', color: '#95ff95' },
            ticks: { color: '#95ff95' }
          }
        },
        plugins: {
          legend: { labels: { color: '#95ff95' } },
          title: { display: false }
        }
      },
      // Bar 차트 데이터
      barData: {
        labels: ['Spring Boot', 'UbiAccess'],
        datasets: [
          {
            label: '실패율 (%)',
            data: [2, 5], 
            backgroundColor: ['#00ff4c', '#f2ff00']
          }
        ]
      },
      barOptions: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: { labels: { color: '#95ff95' } },
          title: { display: false }
        },
        scales: {
          y: {
            beginAtZero: true,
            title: { display: true, text: '실패율 (%)', color: '#95ff95' },
            ticks: { color: '#95ff95' }
          },
          x: {
            ticks: { color: '#95ff95' }
          }
        }
      }
    };
  }
};
</script>

<style scoped>
/* Google Font */
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');

* {
  font-family: 'Inter', sans-serif;
  box-sizing: border-box;
}

/* 전체 레이아웃 */
.pc-layout {
  width: 100vw;
  height: 115vh;
  background-color: #0d0d0d;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  padding: 20px 0;
  color: #fff;
}

/* 콘텐츠 영역 */
.content-wrapper {
  width: 100%;
  max-width: 1600px;
  padding: 0 20px;
}

/* 메인 카드 */
.card {
  background-color: #1a1a1a;
  color: #fff;
  border-radius: 16px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.5);
  margin-top: 140px;
  left: 140px;
  width: 1000px;
  padding: 20px;
}

/* 공통 텍스트 스타일 */
.card-title { font-size: 20px; font-weight: 600; color: #e0e0e0; }
.card-text { font-size: 16px; color: #b3b3b3; }

/* Spring 카드 */
.card-spring {
  position: absolute;
  top: 50px;
  left: 200px;
  background-color: #00ff4c;
  color: #000;
  border-radius: 12px;
  z-index: 10;
  width: 200px;
  height: 100px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 700;
  font-size: 22px;
  margin-top: 550px;
}

/* Ubiaccess 카드 */
.card-ubiaccess {
  position: absolute;
  top: 50px;
  left: 450px;
  background-color: #f2ff00;
  color: #000;
  border-radius: 12px;
  z-index: 10;
  width: 200px;
  height: 100px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 700;
  font-size: 22px;
  margin-top: 550px;
}

/* 그래프 카드 */
.card-graph {
  position: absolute;
  top: 50px;
  left: 200px;
  background-color: #121212;
  color: #95ff95;
  border-radius: 16px;
  z-index: 10;
  width: 450px;
  height: 300px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 210px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.5);
  padding: 15px;
}

/* Bar 차트 카드 */
.card-bar {
  position: absolute;
  top: 50px;
  left: 700px;
  background-color: #1a1a1a;
  color: #95ff95;
  border-radius: 16px;
  z-index: 10;
  width: 400px;
  height: 250px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 250px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.5);
  padding: 15px;
}

/* 결과 카드 */
.status-container {
  position: relative;
  display: grid;
  grid-template-rows: auto 1fr; /* 위쪽 1개, 아래쪽 2개 */
  gap: 15px;
  left: 700px;
  margin-top: 100px;
  height: 350px;
  transform: translateY(250px);
}


/* 아래쪽 카드 2개 */
.card-bottom {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 40px;
}

/* 작은 카드 스타일 */
.card-small {
  background-color: #2a2a2a;
  color: #b3b3b3;
  border-radius: 20px;
  padding: 15px;
  text-align: center;
  height: 100px;
}
</style>
