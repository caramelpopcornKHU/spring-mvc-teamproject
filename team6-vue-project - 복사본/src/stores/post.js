import { ref } from "vue";
import { defineStore } from "pinia";

export const usePostStore = defineStore("post", () => {
  /*state*/

  // 전체화면 모드인지 여부 (전체화면 모드에서는 상단 타이틀과 하단 탭이 보이지 않음)
  const fullScreen = ref(false);

  const posts = ref([]);

  //추가, 수정 화면 중 어떤 모드인지 구분
  // 'add': 추가 모드
  // 'modify': 수정 모드
  const mode = ref("add");

  // user 이름
  const user = ref("anonymous");

  // 배열 안의 아이템 중에서 몇 번째 아이템이 선택되었는지 대한 인덱스 값
  const selectedIndex = ref(-1);

  /*action*/

  /*getter*/

  /*return*/
  return {
    /*state*/
    fullScreen,
    posts,
    mode,
    selectedIndex,
    user,

    /*action*/

    /*getter*/
  };
});
