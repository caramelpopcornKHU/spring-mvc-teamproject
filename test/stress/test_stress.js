import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
    // stages를 사용해 시간에 따라 가상 사용자(VUs) 수를 조절
    stages: [
        { duration: '1m', target: 2000 }, // 1분 동안 VUs를 0에서 2000까지 점진적으로 증가
        { duration: '30s', target: 2000 }, // 2000 VUs 상태를 30초간 유지
        { duration: '30s', target: 0 },    // 30초 동안 VUs를 0으로 점진적으로 감소
    ],
};

const SPRING_BOOT_API_URL = 'http://localhost:8080/api/users/6';
const NODE_JS_API_URL = 'http://localhost:8001/api/users/list-all';


export default function () {
    const res = http.get(SPRING_BOOT_API_URL);
    //const res = http.get(NODE_JS_API_URL);
    check(res, { 'status was 200': (r) => r.status === 200 });
    sleep(1);
}