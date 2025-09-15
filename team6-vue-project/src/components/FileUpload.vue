<template>
  <div
    class="file-uploader"
    :class="{ 'is-dragging': isDragging }"
    @dragover.prevent="isDragging = true"
    @dragleave.prevent="isDragging = false"
    @drop.prevent="handleDrop"
    @click="triggerFileInput"
  >
    <div v-if="imagePreview" class="image-preview" :style="{ backgroundImage: 'url(' + imagePreview + ')' }"></div>
    
    <div v-else class="upload-prompt">
      <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
      <p>드래그하거나 클릭하여 업로드</p>
    </div>

    <input type="file" @change="handleFileChange" accept="image/*" class="file-input" ref="fileInputRef" />
  </div>
</template>

<script setup>
import { ref } from 'vue';

// App.vue로부터 imagePreview URL을 받기 위한 설정
defineProps(['imagePreview']);
// App.vue에게 'file-change' 이벤트를 보내기 위한 설정
const emit = defineEmits(['file-change']);

const isDragging = ref(false);
const fileInputRef = ref(null);

// '파일 선택' 창에서 파일을 골랐을 때 실행
const handleFileChange = (e) => {
  const file = e.target.files[0];
  if (file) {
    emit('file-change', file);
  }
  e.target.value = ''; // 같은 파일 재선택을 위해 초기화
};

// 파일을 드래그해서 영역에 놓았을 때 실행
const handleDrop = (e) => {
  isDragging.value = false;
  const file = e.dataTransfer.files[0];
  if (file && file.type.startsWith('image/')) { // 이미지 파일만 허용
    emit('file-change', file);
  }
};

// 파일 업로드 영역을 클릭했을 때, 숨겨진 input을 대신 클릭해 줌
const triggerFileInput = () => {
  fileInputRef.value?.click();
};
</script>

<style scoped>
.file-uploader {
  width: 100%;
  height: 220px;
  border: 2px dashed #ced4da; /* 옅은 회색 점선 */
  border-radius: 16px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
  background-color: #f8f9fa; 
}

.file-uploader:hover,
.file-uploader.is-dragging {
  border-color: #007BFF; /* 호버 시 파란색으로 강조 */
  background-color: #e7f3ff; /* 매우 옅은 파란색 배경 */
}

.file-input { display: none; }

.upload-prompt {
  text-align: center;
  color: #6c757d; /* 안내 문구 텍스트 색상 */
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 12px;
  transition: transform 0.3s ease;
}

.upload-prompt svg {
  color: #adb5bd; /* 아이콘 색상 */
  transition: color 0.3s ease;
}

.file-uploader:hover .upload-prompt svg,
.file-uploader:hover .upload-prompt p {
    color: #007BFF;
}

.upload-prompt p {
  margin: 0;
  font-size: 1.1rem;
  font-weight: 500;
  line-height: 1.5;
  transition: color 0.3s ease;
}

.image-preview {
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  border-radius: 14px;
}
</style>