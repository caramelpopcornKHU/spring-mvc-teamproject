<template>
  <div id="ai-dashboard-wrapper">
    <div id="ai-dashboard">
      <header class="app-header">
        <h1>SIA AI LAB</h1>
        <p>AI 모델 학습 및 이미지 적용 대시보드</p>
      </header>

      <main class="main-content">
        <div class="panels-container">
          <div class="panel training-panel">
            <div class="panel-header">
              <h2>AI 모델 학습 데이터</h2>
              <p>학습에 사용할 이미지를 업로드하세요.</p>
            </div>
            <FileUpload @file-change="handleTrainingFile" :image-preview="trainingImagePreview" />
            <button
              @click="startTraining"
              :disabled="!trainingImageFile || isTraining"
              class="action-button"
            >
              <span v-if="!isTraining">학습 시작</span>
              <span v-else class="spinner"></span>
            </button>
          </div>

          <div class="panel application-panel">
            <div class="panel-header">
              <h2>AI 적용 대상 이미지</h2>
              <p>효과를 적용할 이미지를 업로드하세요.</p>
            </div>
            <FileUpload @file-change="handleApplicationFile" :image-preview="applicationImagePreview" />
            <button
              @click="generateResult"
              :disabled="!applicationImageFile || isGenerating"
              class="action-button primary"
            >
              <span v-if="!isGenerating">결과 생성</span>
              <span v-else class="spinner"></span>
            </button>
          </div>
        </div>

        <div class="panel result-panel">
          <div class="panel-header">
            <h2>처리 결과</h2>
            <p>AI 모델이 적용된 최종 결과입니다.</p>
          </div>
          <div class="result-image-wrapper">
            <img v-if="resultImage" :src="resultImage" alt="AI 처리 결과" />
            <div v-else class="placeholder">
              <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="18" x="3" y="3" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><path d="M21 15l-5-5L5 21"/></svg>
              <span>이미지가 생성됩니다.</span>
            </div>
          </div>
          <button :disabled="!resultImage" @click="downloadResult" class="action-button primary">
            결과 다운로드
          </button>
        </div>
      </main>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import FileUpload from '@/components/FileUpload.vue'; 

// 1. 학습 패널 상태 변수
const trainingImageFile = ref(null);
const trainingImagePreview = ref('');
const isTraining = ref(false);

// 2. 적용 패널 상태 변수
const applicationImageFile = ref(null);
const applicationImagePreview = ref('');
const isGenerating = ref(false);

// 3. 결과 패널 상태 변수
const resultImage = ref('');

// 공통 파일 처리 함수
const handleFile = (file, fileRef, previewRef) => {
  fileRef.value = file;
  if (file) {
    const reader = new FileReader();
    reader.onload = (e) => {
      previewRef.value = e.target.result;
    };
    reader.readAsDataURL(file);
  } else {
    previewRef.value = '';
  }
};

const handleTrainingFile = (file) => handleFile(file, trainingImageFile, trainingImagePreview);
const handleApplicationFile = (file) => handleFile(file, applicationImageFile, applicationImagePreview);

// '학습 시작' 버튼 로직
const startTraining = () => {
  if (!trainingImageFile.value) return;
  isTraining.value = true;
  setTimeout(() => {
    isTraining.value = false;
    alert('모델 학습이 완료되었습니다.');
  }, 2000);
};

// '결과 생성' 버튼 로직
const generateResult = () => {
  if (!applicationImageFile.value) return;
  isGenerating.value = true;
  setTimeout(() => {
    resultImage.value = applicationImagePreview.value;
    isGenerating.value = false;
  }, 3000);
};

// '결과 다운로드' 버튼 로직
const downloadResult = () => {
  if (!resultImage.value) return;
  const link = document.createElement('a');
  link.href = resultImage.value;
  link.download = 'ai_result_image.png';
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap');
html, body {
  margin: 0;
  padding: 0;
  min-height: 100vh;
  background-color: #0d0d0d;
  overflow-y: auto; /* ✅ 기본 스크롤 */
}
body .app-default {
  background-color: black;
}

/* --- 전체 레이아웃 및 폰트 --- */
#ai-dashboard-wrapper {
  background-color: #0d0d0d; 
  font-family: 'Noto Sans KR', sans-serif;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  min-height: 100vh;
  padding: 50px 20px;
  margin: 0;
  width: 100%;
  box-sizing: border-box;
}

#ai-dashboard {
  width: 100%;
  max-width: 1100px;
  color: #333; /* 기본 텍스트 색상 */
}

/* --- 헤더 --- */
.app-header {
  text-align: center;
  margin-bottom: 40px;
}
.app-header h1 {
  font-size: 3rem;
  font-weight: 700;
  color: #ffffff;
  margin: 0;
}
.app-header p {
  font-size: 1.2rem;
  color: #ffffff;
  margin-top: 8px;
}

/* --- 메인 레이아웃 --- */
.main-content {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.panels-container {
  display: flex;
  grid-template-columns: 1fr 1fr;
  gap: 30px;
}

/* --- 패널 공통 스타일 --- */
.panel {
  background-color: #ffffff; /* 순백색 패널 배경 */
  border: 1px solid #e0e6ed; /* 옅은 회색 테두리 */
  border-radius: 20px; /* 더 부드러운 모서리 */
  padding: 28px;
  display: flex;
  flex-direction: column;
  gap: 20px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05); /* 은은한 그림자 */
  transition: transform 0.3s ease, box-shadow 0.3s ease;
 
}
.panel-header {
  text-align: center;
}
.panel-header h2 {
  margin: 0 0 8px 0;
  font-size: 1.5rem;
  font-weight: 500;
  color: #1a253c;
}
.panel-header p {
  margin: 0;
  font-size: 1rem;
  color: #6a738b;
}

/* --- 액션 버튼 --- */
.action-button {
  width: 100%;
  padding: 15px 20px;
  font-size: 1.1rem;
  font-weight: 500;
  border-radius: 12px;
  cursor: pointer;
  border: none;
  transition: all 0.2s ease;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 52px;
}
.action-button:active:not(:disabled) {
  transform: scale(0.98);
}
.action-button:disabled {
  cursor: not-allowed;
  opacity: 0.6;
}

/* 기본 버튼 (학습 시작) */
.training-panel .action-button {
  background-color: #007BFF; /* 중립적인 회색 */
  color: #ffffff;
}
.training-panel .action-button:hover:not(:disabled) {
  background-color: #0056b3;
}

/* 주요 버튼 (결과 생성, 다운로드) */
.action-button.primary {
  background-color: #007BFF; /* 명확한 파란색 포인트 */
  color: #ffffff;
}
.action-button.primary:hover:not(:disabled) {
  background-color: #0056b3;
}

/* --- 결과 패널 --- */
.result-image-wrapper {
  width: 100%;
  background-color: #f8f9faa3; 
  border-radius: 16px;
  aspect-ratio: 16 / 9;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  border: 1px solid #dee2e6;
}
.result-image-wrapper img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}
.result-image-wrapper .placeholder {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1.2rem;
  color: #6c757d;
  font-size: 1.1rem;
}
.result-image-wrapper .placeholder svg {
  color: #adb5bd;
}


/* --- 스피너(로딩 아이콘) --- */
.spinner {
  width: 24px;
  height: 24px;
  border: 4px solid rgba(255, 255, 255, 0.3);
  border-radius: 50%;
  border-top-color: #fff; /* 흰색 스피너 */
  animation: spin 1s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

/* --- 반응형 디자인 --- */
@media (max-width: 900px) {
  .panels-container { grid-template-columns: 1fr; }
}
@media (max-width: 768px) {
  #ai-dashboard-wrapper { padding: 30px 15px; }
  .app-header h1 { font-size: 2.5rem; }
  .panel { padding: 20px; }
}
</style>