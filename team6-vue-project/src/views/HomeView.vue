<template>
  <section class="landing">
    <div class="landing-center">
      <header class="hero" role="banner">
        <h1 class="title">{{ title }}</h1>
        <p v-if="subtitle" class="subtitle">{{ subtitle }}</p>
      </header>

      <div class="tiles">
        <!-- 왼쪽 타일 -->
        <div
          class="tile tile-left"
          role="button"
          tabindex="0"
          @click="goToGraph"
          @keydown.enter.prevent="goToGraph"
          @keydown.space.prevent="goToGraph"
        >
          <div class="tile-body">
            <h2>{{ leftTitle }}</h2>
            <p v-if="leftDesc">{{ leftDesc }}</p>
          </div>
        </div>

        <!-- 오른쪽 타일 -->
        <div
          class="tile tile-right"
          role="button"
          tabindex="0"
          @click="goToAi"
          @keydown.enter.prevent="goToAi"
          @keydown.space.prevent="goToAi"
        >
          <div class="tile-body">
            <h2>{{ rightTitle }}</h2>
            <p v-if="rightDesc">{{ rightDesc }}</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'HomeView',
  props: {
    title:     { type: String, default: '메인 화면' },
    subtitle:  { type: String, default: '~~~~~~~~~~~~~~' },
    leftTitle: { type: String, default: '트래픽 성능 비교' },
    leftDesc:  { type: String, default: 'Spring Boot vs Node.js – 처리속도 & 응답시간' },
    rightTitle:{ type: String, default: '형민 API' },
    rightDesc: { type: String, default: '~~~~~~~~~~~~~~~~~' },
  },
  methods: {
    goToGraph() { this.$router && this.$router.push({ name: 'graph' }); },
    goToAi()    { this.$router && this.$router.push({ name: 'ai' }); },
  },
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap');
* { box-sizing: border-box; font-family: 'Inter', sans-serif; }

/* 뷰포트 전체 차지 (부모 레이아웃 영향 차단) */
.landing{
  position: fixed;
  inset: 0;
  background:#0d0d0d;
  color:#fff;
  display:flex;
  justify-content: flex-start;    /* 가운데 정렬은 안쪽 래퍼가 수행 */
  align-items:flex-start;
  padding: 4vh 0;
  overflow: auto;
}

/* 가운데 정렬 래퍼 */
.landing-center{
  width: min(1400px, 94svw);
  margin-inline: auto;            /* ✅ 정확히 가운데 */
  padding-inline: clamp(12px, 2svw, 24px);
}

/* 상단 타이틀 박스 */
.hero{
  width: 100%;
  min-height: clamp(140px, 14vh, 160px);
  background:#151515;
  border: 3px solid #303030;
  border-radius: 14px;
  box-shadow: 0 8px 26px rgba(0,0,0,.45);
  display:flex; flex-direction:column; align-items:center; justify-content:center;
  text-align:center;
  margin-bottom: 70px;
}
.title{ font-weight:800; font-size:clamp(1.6rem, 3vw, 2.6rem); margin:0; letter-spacing:.2px; }
.subtitle{ margin:.4rem 0 0; color:#b8b8b8; font-size:clamp(.9rem, 1.1vw, 1.05rem); }

/* 하단 타일 그리드 */
.tiles{
  width: 100%;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: clamp(18px, 3vw, 42px);
  align-items: center;
  margin-top: clamp(20px, 4vh, 40px);
}

/* 타일 공통 */
.tile{
  height: clamp(260px, 52vh, 420px);
  background:#141414;
  border: 3px solid #303030;
  border-radius: 14px;
  box-shadow: 0 10px 28px rgba(0,0,0,.45);
  transition: transform .18s ease, box-shadow .18s ease, border-color .18s ease, background .18s ease;
  cursor: pointer;
  color: inherit; text-decoration: none; outline: none;

  /* 오버레이를 위한 준비 */
  position: relative; z-index: 0; overflow: hidden;
}
.tile:hover{ transform: translateY(-4px); }
.tile:focus-visible{ outline: 3px solid #00ffa0; outline-offset: 4px; border-radius: 16px; }

.tile-body{
  height: 100%; width: 100%;
  display: flex; flex-direction: column; align-items: center; justify-content: center;
  padding: 2rem; text-align: center;
}
.tile-body h2{ margin: 0 0 .6rem; font-weight:800; font-size: clamp(1.2rem, 1.9vw, 1.8rem); }
.tile-body p { margin:0; color:#c6c6c6; font-size: clamp(.9rem, 1.1vw, 1.05rem); }

/* 모바일 */
@media (max-width: 820px){
  .tiles{ grid-template-columns: 1fr; }
  .tile{ height: clamp(220px, 40vh, 360px); }
}

/* 전역 패딩/마진 무효화(이 화면 한정) */
:global(body){ margin:0 !important; padding:0 !important; }
:global(#app){  margin:0 !important; padding:0 !important; }

/* ─── 왼쪽/오른쪽 개별 색 오버레이 ─── */
.tile > *{ position: relative; z-index: 1; }

.tile-left::after{
  content:"";
  position:absolute; inset:0;
  background:#0e1a14; /* 왼쪽 기본 배경 */
  z-index:0; pointer-events:none;
}
.tile-left:hover::after{ background:#122219; }
.tile-left:hover{ border-color:#3bdc7b; box-shadow:0 10px 28px rgba(59,220,123,.28); }

.tile-right::after{
  content:"";
  position:absolute; inset:0;
  background:#1a180f; /* 오른쪽 기본 배경 */
  z-index:0; pointer-events:none;
}
.tile-right:hover::after{ background:#222010; }
.tile-right:hover{ border-color:#ffe34d; box-shadow:0 10px 28px rgba(255,227,77,.24); }
</style>
