<template>
  <!-- 라우터만 렌더: 별도 래퍼/클래스 넣지 말기 (Metronic 영향 최소화) -->
  <router-view />
</template>

<script setup>
// 아무것도 필요 없음
</script>

<style>
/* 전역 기본 높이/마진 리셋 */
html, body, #app { height: 100%; margin: 0; }
</style>
