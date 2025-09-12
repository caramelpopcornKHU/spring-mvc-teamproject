<template>
  <div class="full-screen">
    <div class="content-wrapper">
      <div class="row g-4">
        <!-- 평균 응답시간 카드 -->
        <div class="col-4">
          <div class="card post-card text-center h-100">
            <div class="card-body">
              <h5 class="card-title">평균 응답시간</h5>
              <p class="display-6 text-success">{{ avgResponseTime }} ms</p>
            </div>
          </div>
        </div>

        <!-- 성공률 카드 -->
        <div class="col-4">
          <div class="card post-card text-center h-100">
            <div class="card-body">
              <h5 class="card-title">성공률</h5>
              <p class="display-6 text-info">{{ successRate }}%</p>
            </div>
          </div>
        </div>

        <!-- 실패율 카드 -->
        <div class="col-4">
          <div class="card post-card text-center h-100">
            <div class="card-body">
              <h5 class="card-title">실패율</h5>
              <p class="display-6 text-danger">{{ failRate }}%</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";

const avgResponseTime = ref(120);
const successRate = ref(98);
const failRate = ref(2);
</script>

<style scoped>
/* 화면 전체를 감싸는 배경 */
.full-screen {
  background-color: #000;   /* 검은색 배경 */
  min-height: 100vh;        /* 화면 전체 높이 */
  display: flex;
  justify-content: center;   /* 가로 중앙 정렬 */
  align-items: center;       /* 세로 중앙 정렬 */
  padding: 20px;
  box-sizing: border-box;
}

/* 내용 영역: 최대 너비 1600px */
.content-wrapper {
  width: 100%;
  max-width: 1600px;
}

/* 카드 스타일 */
.post-card {
  border: none;
  border-radius: 0.75rem;
  box-shadow: 0 4px 12px rgba(255, 255, 255, 0.15);
  transition: transform 0.3s ease-in-out;
  background-color: #1e1e2f;
  color: #fff;
  min-height: 180px;
}

.post-card:hover {
  transform: translateY(-6px);
}
</style>
