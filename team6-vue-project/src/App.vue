<template>
  <!-- 앱 뷰 비워두기 -->
  <div class="d-flex flex-column h-100">
    <div class="d-flex flex-column flex-root app-root" id="kt_app_root">
      <RouterView />
    </div>
  </div>
</template>

<script setup>
import { useRouter } from "vue-router";
const router = useRouter();

// 스토어 사용하지 않아도 됨
</script>

<style scoped>
/* 기존 드로어나 탭 관련 스타일 제거 가능 */
</style>
