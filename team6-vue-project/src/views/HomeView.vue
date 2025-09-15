<template>
  <section class="landing">
    <div class="landing-center">
      <header class="hero" role="banner">
        <h1 class="title">{{ title }}</h1>
        <p v-if="subtitle" class="subtitle">{{ subtitle }}</p>
      </header>

      <div class="tiles">
        <div
          class="tile tile-left"
          role="button"
          tabindex="0"
          @click="goToGraph"
          @keydown.enter.prevent="goToGraph"
          @keydown.space.prevent="goToGraph"
        >
          <div class="tile-icon">
            <i class="fas fa-chart-line"></i>
          </div>
          <div class="tile-body">
            <h2>{{ leftTitle }}</h2>
            <p v-if="leftDesc">{{ leftDesc }}</p>
          </div>
          <span class="tile-cta">분석 보기 →</span>
        </div>

        <div
          class="tile tile-right"
          role="button"
          tabindex="0"
          @click="goToAi"
          @keydown.enter.prevent="goToAi"
          @keydown.space.prevent="goToAi"
        >
          <div class="tile-icon">
            <i class="fas fa-microchip"></i>
          </div>
          <div class="tile-body">
            <h2>{{ rightTitle }}</h2>
            <p v-if="rightDesc">{{ rightDesc }}</p>
          </div>
          <span class="tile-cta">API 탐색 →</span>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'HomeView',
  props: {
    title:      { type: String, default: 'Project Dashboard' },
    subtitle:   { type: String, default: '프로젝트의 핵심 기능을 선택하여 탐색하세요.' },
    leftTitle:  { type: String, default: '트래픽 성능 비교' },
    leftDesc:   { type: String, default: 'Spring Boot vs Node.js – 처리속도 & 응답시간' },
    rightTitle: { type: String, default: 'AI 기능 API' },
    rightDesc:  { type: String, default: '인공지능 기반의 특수 기능 API를 호출하고 테스트합니다.' },
  },
  methods: {
    goToGraph() { this.$router && this.$router.push({ name: 'graph' }); },
    goToAi()    { this.$router && this.$router.push({ name: 'ai' }); },
  },
};
</script>

<style scoped>
/* 폰트 및 아이콘 */
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap');
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css");

* { box-sizing: border-box; font-family: 'Inter', sans-serif; }

/* 페이지 진입 애니메이션 */
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
@keyframes slideUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

/* 전체 배경 및 레이아웃 */
.landing {
  position: fixed;
  inset: 0;
  background-color: #121212; /* 더 깊은 검정 배경 */
  color: #ffffff; /* 기본 글자색 (흰색) */
  display: flex;
  justify-content: flex-start;
  align-items: flex-start;
  padding: 4vh 0;
  overflow: auto;
  animation: fadeIn 0.6s ease-out;
}

.landing-center {
  width: min(1400px, 94svw);
  margin-inline: auto;
  padding-inline: clamp(12px, 2svw, 24px);
}

/* 상단 타이틀 */
.hero {
  width: 100%;
  min-height: clamp(140px, 14vh, 160px);
  background: #1E1E1E; /* 배경보다 살짝 밝은 카드 색 */
  border: 1px solid #2d2d2d;
  border-radius: 16px;
  box-shadow: 0 8px 32px rgba(0,0,0,0.3);
  display: flex; flex-direction: column; align-items: center; justify-content: center;
  text-align: center;
  margin-bottom: 60px;
  animation: slideUp 0.6s 0.2s backwards;
}
.title {
  font-weight: 800;
  font-size: clamp(1.6rem, 3vw, 2.6rem);
  margin: 0;
  color: #ffffff; /* 제목 (흰색) */
}
.subtitle {
  margin: .4rem 0 0;
  color: #BDBDBD; /* 부제 (밝은 회색) - 가독성 확보 */
  font-size: clamp(.9rem, 1.1vw, 1.05rem);
  max-width: 80%;
}

/* 하단 타일 그리드 */
.tiles {
  width: 100%;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: clamp(18px, 3vw, 42px);
  align-items: center;
}
.tiles > *:nth-child(1) { animation: slideUp 0.6s 0.4s backwards; }
.tiles > *:nth-child(2) { animation: slideUp 0.6s 0.5s backwards; }

/* 타일 공통 */
.tile {
  height: clamp(280px, 54vh, 440px);
  background: #1E1E1E; /* 카드 색 */
  border: 1px solid #2d2d2d;
  border-radius: 16px;
  box-shadow: 0 8px 24px rgba(0,0,0,0.3);
  transition: transform .2s ease, box-shadow .2s ease, border-color .2s ease, background-color .2s ease;
  cursor: pointer;
  color: inherit;
  text-decoration: none;
  outline: none;
  position: relative;
  display: flex; flex-direction: column; align-items: center; justify-content: center;
  text-align: center;
  padding: 2rem;
}
.tile:hover {
  transform: translateY(-8px);
  background-color: #2a2a2a;
}
.tile:focus-visible {
  outline: 3px solid #3bdc7b;
  outline-offset: 4px;
}

/* 타일 아이콘 */
.tile-icon {
  font-size: clamp(2.5rem, 4vw, 3.5rem);
  margin-bottom: 1.2rem;
  transition: transform 0.3s ease;
}
.tile:hover .tile-icon { transform: scale(1.1); }

/* 타일 본문 */
.tile-body h2 {
  margin: 0 0 .6rem;
  font-weight: 800;
  font-size: clamp(1.2rem, 1.9vw, 1.8rem);
  color: #ffffff;
}
.tile-body p {
  margin: 0;
  color: #BDBDBD; /* 설명 글자 (밝은 회색) - 가독성 확보 */
  font-size: clamp(.9rem, 1.1vw, 1.05rem);
}

/* 타일 Call-to-Action 텍스트 */
.tile-cta {
  position: absolute;
  bottom: 2rem;
  opacity: 0;
  transform: translateY(10px);
  transition: opacity 0.3s ease, transform 0.3s ease, color 0.3s ease;
  font-weight: 600;
  font-size: 0.9rem;
  color: #BDBDBD;
}
.tile:hover .tile-cta {
  opacity: 1;
  transform: translateY(0);
}

/* 왼쪽 타일 (성능) */
.tile-left .tile-icon { color: #3bdc7b; } /* 초록색 */
.tile-left:hover {
  border-color: #3bdc7b;
  box-shadow: 0 10px 30px rgba(59, 220, 123, 0.15);
}
.tile-left:hover .tile-cta { color: #3bdc7b; }

/* 오른쪽 타일 (AI) */
.tile-right .tile-icon { color: #ffe34d; } /* 노란색 */
.tile-right:hover {
  border-color: #ffe34d;
  box-shadow: 0 10px 30px rgba(255, 227, 77, 0.15);
}
.tile-right:hover .tile-cta { color: #ffe34d; }

/* 모바일 */
@media (max-width: 820px) {
  .tiles { grid-template-columns: 1fr; }
  .tile { height: clamp(240px, 40vh, 380px); }
}

/* 전역 스타일 무효화 */
:global(body), :global(#app) { margin: 0 !important; padding: 0 !important; }
</style>