<template>
  <div class="main-container">
    <h2 class="title">이미지 합성</h2>

    <div class="uploader-container">
      <div class="image-upload-area">
        <input
          type="file"
          id="learningImageInput"
          accept="image/*"
          @change="handleFileChange($event, 0)"
          class="file-input"
        />
        <label for="learningImageInput" class="upload-label">
          <span v-if="!uploadedFiles[0]">
            <i class="icon-camera"></i> 학습 사진 업로드
          </span>
          <img v-else :src="uploadedFiles[0].preview" alt="업로드된 학습 사진" class="preview-image" />
        </label>
      </div>

      <div class="plus-icon">+</div>

      <div class="image-upload-area">
        <input
          type="file"
          id="reflectionImageInput"
          accept="image/*"
          @change="handleFileChange($event, 1)"
          class="file-input"
        />
        <label for="reflectionImageInput" class="upload-label">
          <span v-if="!uploadedFiles[1]">
            <i class="icon-camera"></i> 반영 사진 업로드
          </span>
          <img v-else :src="uploadedFiles[1].preview" alt="업로드된 반영 사진" class="preview-image" />
        </label>
      </div>
    </div>

    <button
      @click="uploadAndProcess"
      :disabled="!uploadedFiles[0] || !uploadedFiles[1] || loading"
      class="process-button"
    >
      <span v-if="!loading">합성 시작</span>
      <span v-else>합성 중...</span>
    </button>

    <div v-if="resultImage" class="result-container">
      <h3>합성 결과</h3>
      <img :src="resultImage" alt="합성 결과 이미지" class="result-image" />
      <button @click="downloadResult" class="download-button">결과 다운로드</button>
    </div>

    <div v-if="loading" class="loading-overlay">
      <div class="spinner"></div>
    </div>
  </div>
</template>
<script setup>
import { ref } from 'vue';
import axios from 'axios';

// 반응형 상태 변수들
const uploadedFiles = ref([]); // 업로드된 파일 배열 (각 요소는 { file: File 객체, preview: URL } 형태)
const resultImage = ref(null); // 합성 결과 이미지의 URL
const loading = ref(false);     // 로딩 상태 (true일 때 로딩 스피너 표시)

// 파일 선택 시 호출되는 함수
const handleFileChange = (event, index) => {
  const file = event.target.files[0];
  if (file) {
    uploadedFiles.value[index] = {
      file: file,
      preview: URL.createObjectURL(file) // 이미지 미리보기를 위한 URL 생성
    };
  }
};

// 이미지 업로드 및 합성 요청 함수
const uploadAndProcess = async () => {
  if (!uploadedFiles.value[0] || !uploadedFiles.value[1]) {
    alert('두 이미지를 모두 업로드해주세요.');
    return;
  }

  const formData = new FormData(); // 파일을 백엔드로 보내기 위한 FormData 객체 생성
  formData.append('learning_image', uploadedFiles.value[0].file); // 백엔드에서 사용할 키와 파일 매핑
  formData.append('reflection_image', uploadedFiles.value[1].file);

  loading.value = true; // 로딩 시작
  resultImage.value = null; // 이전 결과 초기화

  try {
    // 백엔드 API 엔드포인트는 실제 서버 주소로 변경해야 합니다.
    const response = await axios.post('http://your-backend-api.com/process-images', formData, {
      headers: {
        'Content-Type': 'multipart/form-data' // 파일 업로드 시 필수 헤더
      },
      responseType: 'blob' // 서버가 이미지 파일을 Blob 형태로 반환할 때 설정
    });

    // 서버로부터 받은 Blob 데이터를 URL로 변환하여 결과 이미지로 표시
    const imageUrl = URL.createObjectURL(response.data);
    resultImage.value = imageUrl;

  } catch (error) {
    console.error('이미지 합성 중 오류 발생:', error);
    alert('이미지 합성 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
  } finally {
    loading.value = false; // 로딩 종료
  }
};

// 결과 이미지 다운로드 함수 (옵션)
const downloadResult = () => {
  if (resultImage.value) {
    const link = document.createElement('a');
    link.href = resultImage.value;
    link.download = 'synthesized_image.png'; // 다운로드될 파일 이름
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(link.href); // 사용 후 URL 해제
  }

};
</script>

<style scoped>
/* 이전 코드에서 제공된 CSS 스타일을 여기에 붙여넣거나 원하는 대로 수정하세요 */
.main-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 20px;
  padding: 40px;
  font-family: 'Arial', sans-serif;
  background-color: #2c2c2c; /* 어두운 배경 */
  border-radius: 15px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
  color: #f0f0f0;
}

.title {
  font-size: 2.5rem;
  color: #e0e0e0;
  margin-bottom: 30px;
}

.uploader-container {
  display: flex;
  align-items: center;
  gap: 30px;
  margin-bottom: 30px;
}

.image-upload-area {
  width: 250px; /* 크기 조정 */
  height: 250px; /* 크기 조정 */
  border: 2px dashed #666; /* 점선 테두리 */
  border-radius: 12px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  overflow: hidden;
  position: relative;
  transition: border-color 0.3s, background-color 0.3s;
  background-color: #3a3a3a;
}

.image-upload-area:hover {
  border-color: #007bff;
  background-color: #4a4a4a;
}

.file-input {
  display: none;
}

.upload-label {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  text-align: center;
  color: #b0b0b0;
  font-size: 1.1rem;
  cursor: pointer;
}

.icon-camera {
  /* 아이콘 대신 간단한 텍스트나 Font Awesome 등을 사용 */
  font-size: 2rem;
  margin-bottom: 10px;
}
/* Font Awesome 아이콘을 사용하려면 index.html에 CDN 링크를 추가하거나 npm으로 설치해야 합니다 */
/* 예: <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> */


.preview-image {
  width: 100%;
  height: 100%;
  object-fit: cover; /* 이미지가 영역에 꽉 차도록 */
}

.plus-icon {
  font-size: 3.5rem; /* 크기 조정 */
  color: #999;
  font-weight: bold;
}

.process-button {
  padding: 14px 28px;
  font-size: 1.3rem;
  font-weight: bold;
  color: #fff;
  background-color: #007bff;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.2s;
  box-shadow: 0 4px 10px rgba(0, 123, 255, 0.4);
}

.process-button:disabled {
  background-color: #555;
  cursor: not-allowed;
  box-shadow: none;
}

.process-button:hover:not(:disabled) {
  background-color: #0056b3;
  transform: translateY(-2px);
}

.result-container {
  margin-top: 40px;
  text-align: center;
  background-color: #3a3a3a;
  padding: 25px;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
}

.result-container h3 {
  color: #e0e0e0;
  margin-bottom: 20px;
}

.result-image {
  max-width: 600px; /* 결과 이미지 최대 크기 */
  height: auto;
  border: 1px solid #555;
}

</style>