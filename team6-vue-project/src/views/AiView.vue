<!-- src/views/AiView.vue -->
<template>
  <div class="ai-page">
    <header class="app-header">
      <h1>SIA AI LAB</h1>
    </header>

    <main class="main-content">
      <div class="panels-container">
        <!-- 학습 패널 -->
        <div class="panel training-panel">
          <div class="panel-header">
            <h2>AI 모델 학습 데이터</h2>
            <p>학습에 사용할 이미지를 업로드하세요.</p>
          </div>
          <FileUpload
            @file-change="handleTrainingFile"
            :image-preview="trainingImagePreview"
          />
          <button
            @click="startTraining"
            :disabled="!trainingImageFile || isTraining"
            class="action-button"
          >
            <span v-if="!isTraining">학습 시작</span>
            <span v-else class="spinner"></span>
          </button>
        </div>

        <!-- 적용 패널 -->
        <div class="panel application-panel">
          <div class="panel-header">
            <h2>AI 적용 대상 이미지</h2>
            <p>효과를 적용할 이미지를 업로드하세요.</p>
          </div>
          <FileUpload
            @file-change="handleApplicationFile"
            :image-preview="applicationImagePreview"
          />
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

      <!-- 결과 패널 -->
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
        <button
          :disabled="!resultImage"
          @click="downloadResult"
          class="action-button primary"
        >
          결과 다운로드
        </button>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import FileUpload from '@/components/FileUpload.vue'

// 학습 패널 상태
const trainingImageFile = ref(null)
const trainingImagePreview = ref('')
const isTraining = ref(false)

// 적용 패널 상태
const applicationImageFile = ref(null)
const applicationImagePreview = ref('')
const isGenerating = ref(false)

// 결과 패널 상태
const resultImage = ref('')

// 공통 파일 처리
const handleFile = (file, fileRef, previewRef) => {
  fileRef.value = file
  if (file) {
    const reader = new FileReader()
    reader.onload = (e) => (previewRef.value = e.target.result)
    reader.readAsDataURL(file)
  } else {
    previewRef.value = ''
  }
}

const handleTrainingFile = (file) =>
  handleFile(file, trainingImageFile, trainingImagePreview)

const handleApplicationFile = (file) =>
  handleFile(file, applicationImageFile, applicationImagePreview)

// 학습 시작
const startTraining = () => {
  if (!trainingImageFile.value) return
  isTraining.value = true
  setTimeout(() => {
    isTraining.value = false
  }, 2000)
}

// '결과 생성' 버튼 로직 (API 연동)
const generateResult = async () => {
  if (!trainingImageFile.value || !applicationImageFile.value) {
    alert("스타일 이미지와 적용할 이미지를 모두 업로드해주세요.");
    return;
  }

  isGenerating.value = true;
  resultImage.value = ''; // 이전 결과 초기화

  const formData = new FormData();
  formData.append('style_image', trainingImageFile.value); // '학습 이미지'를 '스타일 이미지'로 사용
  formData.append('content_image', applicationImageFile.value); // '적용 이미지'를 '콘텐츠 이미지'로 사용
  
  try {
    const response = await fetch('http://172.168.10.29:8000/style-transfer', { // API 엔드포인트 URL
      method: 'POST',
      body: formData,
    });

    if (!response.ok) {
      throw new Error(`API 오류: ${response.statusText}`);
    }

    // 서버가 반환한 이미지 데이터를 Blob으로 받음
    const imageBlob = await response.blob();
    
    // Blob을 URL로 변환하여 img 태그의 src에 사용
    const imageUrl = URL.createObjectURL(imageBlob);
    resultImage.value = imageUrl;
    
  } catch (error) {
    console.error('스타일 전송 실패:', error);
    alert('이미지 생성에 실패했습니다. 콘솔을 확인해주세요.');
  } finally {
    isGenerating.value = false;
  }
};

// 결과 다운로드
const downloadResult = () => {
  if (!resultImage.value) return
  const link = document.createElement('a')
  link.href = resultImage.value
  link.download = 'ai_result_image.png'
  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
}
</script>

<style>
/* ─────────────────────────────────────────────
   ✅ 메트로닉 상단 고정헤더/오프셋 “전역”에서 제거
   (scoped 제거해야 전역에 제대로 적용됩니다)
   ───────────────────────────────────────────── */
body.app-default[data-kt-app-header-fixed="true"] .app-wrapper { padding-top: 0 !important; }
#kt_app_header { display: none !important; }
:root { --kt-app-header-height: 0 !important; }

/* 기본 배경/폰트 */
html, body {
  margin: 0;
  padding: 0;
  background-color: #0d0d0d;
  font-family: 'Noto Sans KR', sans-serif;
  overflow-y: auto;
}

/* 상단 안전영역 + 여백 */
.ai-page .app-header {
  position: relative;
  z-index: 1;
  text-align: center;

  /* 먼저 구버전(iOS 11) */
  padding-top: calc(constant(safe-area-inset-top, 0px) + 32px);
  /* 신버전이 덮어씀 */
  padding-top: calc(env(safe-area-inset-top, 0px) + 32px);

  padding-right: 20px;
  padding-bottom: 20px;
  padding-left: 20px;
  color: #fff;
}

.ai-page .app-header h1 {
  margin: 0;
  font-size: 3rem;
  font-weight: 700;
}

/* 본문 */
.ai-page .main-content {
  max-width: 1100px;
  margin: 0 auto;
  padding: 20px 15px 150px;
  display: flex;
  flex-direction: column;
  gap: 30px;
  min-height: 100vh;
  box-sizing: border-box;
}

.ai-page .panels-container {
  display: flex;
  gap: 30px;
  flex-wrap: wrap;
}

.ai-page .panel {
  background-color: #fff;
  border-radius: 20px;
  padding: 28px;
  flex: 1 1 45%;
  box-shadow: 0 4px 12px rgba(0,0,0,0.05);
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.ai-page .panel-header { text-align: center; }
.ai-page .panel-header h2 { margin: 0 0 8px 0; color: #1a253c; font-size: 1.5rem; }
.ai-page .panel-header p  { margin: 0; font-size: 1rem; color: #6a738b; }

.ai-page .action-button {
  width: 100%;
  padding: 15px;
  border-radius: 12px;
  font-size: 1.1rem;
  font-weight: 500;
  cursor: pointer;
  border: none;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 52px;
}
.ai-page .action-button:disabled { opacity: .6; cursor: not-allowed; }
.ai-page .training-panel .action-button,
.ai-page .action-button.primary { background-color: #007BFF; color: #fff; }
.ai-page .training-panel .action-button:hover:not(:disabled),
.ai-page .action-button.primary:hover:not(:disabled) { background-color: #0056b3; }

.ai-page .result-image-wrapper {
  width: 100%;
  max-height: 50vw;
  min-height: 20vw;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
  border-radius: 16px;
  background-color: #f8f9faa3;
  border: 1px solid #dee2e6;
}

.ai-page .result-image-wrapper img {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}

.ai-page .result-image-wrapper .placeholder {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1.2rem;
  color: #6c757d;
}
.ai-page .result-image-wrapper .placeholder svg { color: #adb5bd; }

/* 로딩 스피너 */
.spinner {
  width: 24px;
  height: 24px;
  border: 4px solid rgba(255,255,255,0.3);
  border-radius: 50%;
  border-top-color: #fff;
  animation: spin 1s linear infinite;
}
@keyframes spin { to { transform: rotate(360deg); } }

/* 반응형 */
@media (max-width: 900px) { .ai-page .panels-container { flex-direction: column; } }
@media (max-width: 768px) { .ai-page .main-content { padding-bottom: 150px; } }
</style>
