<template>
    <div id="ai-dashboard-wrapper">
  <div id="app">

    <div id="kt_app_body">
      
      <!-- 앱 뷰 비워두기 -->
      <div class="d-flex flex-column h-100">
        <div class="d-flex flex-column flex-root app-root" id="kt_app_root">
        </div>
        <RouterView />
      </div>
    </div>
   </div>
  </div>
</template>

<script setup>
import { useRouter } from "vue-router";
const router = useRouter();

</script>

<style>
/* 기존 드로어나 탭 관련 스타일 제거 가능 */
#kt_app_body.app-default {
  background-color: black;
}

#ai-dashboard-wrapper {display: flex}
#app { display: flex}


</style>

<style scoped>

</style>
