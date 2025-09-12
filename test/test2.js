import http from 'k6/http';
import {check, sleep} from 'k6';

export const options = {
    // 10명의 가상 사용자 (VUs)가 30초 동안 테스트를 수행
    vusers: 50,
    duration: '30s',

    // 더 복잡한 시나리오 (예: Ramp-up/down)
    stages: [
        {duration: '1m', target: 50 }, // 1분 동안 가상 사용자를 50명까지 서서히 늘림
        {duration: '1m', target: 100 }, // 100명 상태로 1분간 유지
        {duration: '30s', target: 0 }, // 30초 동안 0명으로 서서히 줄임
    ],
};

const SPRING_BOOT_API_URL = 'http://localhost:8080/api/users/6';
const NODE_JS_API_URL = 'http://localhost:8001/api/users/list-all';

export default function () {
    // Spring Boot 서버 테스트
    const res1 = http.get(SPRING_BOOT_API_URL);
    check(res1, {'Spring Boot API status was 200': (r) => r.status === 200 });

    // Spring Boot 서버 테스트
    // const res2 = http.get(NODE_JS_API_URL);
    // check(res1, {'Ubiaccess API status was 200': (r) => r.status === 200 });

    sleep(1); // 각 가상 사용자는 요청 후 1초 대기(실제 사용자 행동 모방)

}