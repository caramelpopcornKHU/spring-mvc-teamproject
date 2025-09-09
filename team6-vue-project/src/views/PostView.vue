<template>
  <div class="card">
    <div>dd</div>
    <div class="btn btn-primary">dd</div>
  </div>
    <button class="btn btn-icon btn-warning text-primary">←</button>
</template>

<script setup>


</script>

<style scoped>
.post-card {
  border: none;
  border-radius: 0.75rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  margin-bottom: 1rem;
  transition: transform 0.2s;
}

.post-card:hover {
  transform: translateY(-5px);
}

.post-card img {
  border-radius: 0.5rem;
  object-fit: cover;
  height: 180px;
  width: 100%;
}
</style>
