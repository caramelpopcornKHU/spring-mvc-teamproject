<template>
  <div class="pc-layout">
    <div class="content-wrapper">
      <div class="hero-card">
        <h5 class="card-title">Spring Boot vs Node.js – Traffic Performance Test</h5>
        <p class="card-text">동일 조건에서 트래픽 처리 속도 비교</p>
      </div>

      <div class="test-results-grid">
        <div class="spring-block">
          <div class="btn-group">
            <button class="btn btn-test1">Spring</button>
          </div>
          <div class="chart-card card-graph">
            <h5 class="chart-title">트래픽 처리 속도 비교</h5>
            <div class="chart-body">
              <Line :data="lineData" :options="lineOptions" style="width:100%; height:100%;" />
            </div>
          </div>
        </div>

        <div class="ubiaccess-block">
          <div class="btn-group">
            <button class="btn btn-test2">Ubiaccess</button>
          </div>
          <div class="chart-card card-bar">
            <h5 class="chart-title">평균 응답 시간</h5>
            <div class="chart-body">
              <Bar :data="barData" :options="barOptions" style="width:100%; height:100%;" />
            </div>
            <div class="stats-row">
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
      </div><!-- /test-results-grid -->
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
  Title, Tooltip, Legend,
  LineElement, BarElement, LinearScale, PointElement, CategoryScale
);

export default {
  name: 'TrafficTestView',
  components: { Line, Bar },
  data() {
    return {
      lineData: {
        labels: [100, 200, 300, 400, 500],
        datasets: [
          { label: 'Spring Boot', data: [30, 60, 110, 150, 190],
            borderColor: '#00ff4c', backgroundColor: 'rgba(0, 255, 76, 0.2)', fill: true, tension: 0.3 },
          { label: 'Node.js', data: [25, 55, 95, 140, 175],
            borderColor: '#f2ff00', backgroundColor: 'rgba(242, 255, 0, 0.2)', fill: true, tension: 0.3 }
        ]
      },
      lineOptions: {
        responsive: true, maintainAspectRatio: false,
        scales: {
          y: { beginAtZero: true, title: { display: true, text: 'Response Time (ms)', color: '#95ff95' }, ticks: { color: '#95ff95' } },
          x: { title: { display: true, text: 'Number of Requests', color: '#95ff95' }, ticks: { color: '#95ff95' } }
        },
        plugins: { legend: { labels: { color: '#95ff95' } }, title: { display: false } }
      },
      barData: {
        labels: ['Spring Boot', 'Node.js'],
        datasets: [{ label: 'Average Response Time (ms)', data: [120, 95], backgroundColor: ['#00ff4c', '#f2ff00'] }]
      },
      barOptions: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { display: false }, title: { display: false } },
        scales: {
          y: { beginAtZero: true, title: { display: true, text: 'Response Time (ms)', color: '#95ff95' }, ticks: { color: '#95ff95' } },
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

/* ===== 0) 루트: 스크롤/배경 고정 ===== */
:global(html), :global(body), :global(#app) {
  height: 100%;
  margin: 0;
  background: #0d0d0d;
  overflow: hidden;                 /* 문서 스크롤 제거 */
  overscroll-behavior: none;
}
/* 스크롤바 UI 숨김 */
:global(*::-webkit-scrollbar){ width:0; height:0; display:none; }
:global(body){ scrollbar-width: none; -ms-overflow-style: none; }
/* 캔버스 인라인 간격으로 생기는 미세 스크롤 방지 */
:global(canvas){ display:block; }

/* ===== 1) Metronic/Bootstrap 컨테이너 폭 제한 해제 ===== */
:global(#kt_app_content),
:global(#kt_app_content_container),
:global(.app-content),
:global(.app-container),
:global(.container),
:global(.container-fluid),
:global(.container-xxl) {
  max-width: none !important;
  width: 100vw !important;          /* 뷰포트 기준으로 확장 */
  margin: 0 !important;
  padding-left: 0 !important;
  padding-right: 0 !important;
}
:global(.row){ --bs-gutter-x: 0; --bs-gutter-y: 0; }

/* ===== 2) 화면 루트: 뷰포트 직접 점유 ===== */
.pc-layout {
  position: fixed;                  /* 부모 컨테이너 제한 무시 */
  inset: 0;                         /* = top:0; right:0; bottom:0; left:0 */
  z-index: 1000;                    /* 다른 오버레이 위로 */
  color: #fff;
  background: #0d0d0d;
  overflow: hidden;                 /* 컨테이너 스크롤 차단 */
  isolation: isolate;
}

/* ===== 3) 내부 레이아웃 ===== */
.content-wrapper {
  width: 100%;
  height: 100%;
  padding: 2vh 2vw;
  display: grid;
  grid-template-rows: auto 1fr;     /* 헤더 + 본문 꽉 채움 */
  row-gap: 2vh;
  overflow: hidden;
  min-height: 0;                    /* 자식 overflow 방지 */
}

/* 헤더 */
.hero-card {
  background: #1a1a1a;
  border-radius: 1rem;
  padding: 1.5rem 2rem;
  box-shadow: 0 0.25rem 1rem rgba(0,0,0,0.5);
  text-align: center;
}
.card-title { 
  font-size: clamp(1.6rem, 2.6vw, 2.6rem); 
  font-weight: 800; color: #e0e0e0; 
  transform: translateX(5%);
}
.card-text  { 
  font-size: clamp(0.95rem, 1.1vw, 1.1rem); 
  color: #b3b3b3;
  transform: translateX(4%);
}

/* 본문 2열 그리드 */
.test-results-grid {
  height: 100%;
  min-height: 0;
  display: grid;
  grid-template-columns: 1.2fr 1fr; /* 좌 라인차트 약간 넓게 */
  gap: 1.5rem;
  overflow: hidden;
}

/* 컬럼 블록 */
.spring-block, .ubiaccess-block {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1.5rem;
  min-height: 0;
  width: 100%;
}

/* 버튼 영역 */
.btn-group {
  flex: 0 0 22%;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: stretch;
  min-height: 0;
}
.btn {
  width: min(72%, 720px);
  height: 100%;
  border-radius: 1rem;
  border: none;
  font-weight: 700;
  font-size: clamp(1rem, 1.4vw, 1.4rem);
  cursor: pointer;
  color: #000;
  transition: opacity .2s ease;
}
.btn:hover { opacity: .9; }
.btn-test1 { background-color: #00ff4c; 
left: 15vw;
}
.btn-test2 { background-color: #f2ff00;
right: 11vw;
}


/* 차트 카드 */
.chart-card {
  flex: 1 1 0;
  width: 100%;
  border-radius: 1rem;
  box-shadow: 0 0.25rem 0.75rem rgba(0,0,0,0.5);
  padding: 1rem;
  display: flex;
  flex-direction: column;
  min-height: 0;                   /* 그리드/플렉스 넘침 방지 */
  overflow: hidden;                /* 캔버스 미세 넘침 컷 */
}
.chart-title { color: #95ff95; font-size: 1.2rem; margin: 0 0 1rem; text-align: center; }
.card-graph { background-color: #121212; }
.card-bar   { background-color: #1a1a1a; }

.chart-body { flex: 1 1 0; height: 100%; min-height: 0; }

/* 하단 상태 카드 */
.card-bar .stats-row {
  flex: 0 0 28%;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1.5rem;
  margin-top: 1.5rem;
  min-height: 0;
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
  height: 100%;
  width: 100%;
  box-shadow: 0 0.25rem 0.75rem rgba(0,0,0,0.45);
}
.card-small h6 { margin: .3rem 0; font-size: 1rem; color: #dcdcdc; }
.card-small p  { margin: 0; font-weight: 700; font-size: 1.1rem; color: #fff; }

/* (선택) 진짜 모바일에서만 1열 전환 */
@media (max-width: 600px) {
  .test-results-grid { grid-template-columns: 1fr; }
  .card-bar .stats-row { grid-template-columns: 1fr; }
  .btn { width: 90%; }
}
/* =======================
   👇 컴팩트 사이즈 오버라이드
   ======================= */

/* 헤더 타이틀/텍스트 조금 축소 */
.hero-card {
  padding: clamp(16px, 2vh, 24px) clamp(20px, 2vw, 28px);
}
.card-title { font-size: clamp(1.2rem, 1.8vw, 2.2rem); }
.card-text  { font-size: clamp(0.85rem, 1vw, 1rem); }

/* 그리드 간격 살짝 축소 */
.test-results-grid { gap: clamp(12px, 1.2vw, 20px); }

/* 🔽 버튼 영역: 퍼센트(22%) → 고정/반응형 높이로 변경 */
.btn-group {
  flex: 0 0 auto;                          /* 비율 레이아웃 해제 */
  height: clamp(56px, 9vh, 110px);         /* 화면 커져도 과증가 방지 */
  width: 20vw;
}
.btn {
  width: min(50%, 520px);                   /* 너무 넓어지지 않게 */
  border-radius: 12px;
  font-size: clamp(0.95rem, 1.1vw, 1.2rem);
}

/* 카드 여백/차트 제목 약간 축소 */
.chart-card {
  padding: clamp(12px, 1.2vw, 16px);
}
.chart-title {
  font-size: clamp(0.95rem, 1.1vw, 1.1rem);
  margin-bottom: clamp(8px, 1vh, 14px);
}

/* 하단 통계 영역도 컴팩트하게 */
.card-bar .stats-row {
  flex: 0 0 clamp(110px, 18vh, 160px);
  gap: clamp(12px, 1.2vw, 20px);
  margin-top: clamp(12px, 1vh, 16px);
}
.card-small { padding: clamp(12px, 1.2vw, 16px); }

</style>
