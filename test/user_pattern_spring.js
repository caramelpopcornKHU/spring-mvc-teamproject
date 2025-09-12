import http from 'k6/http';
import { check, sleep, group } from 'k6';

// 테스트 옵션: 1000명의 가상 사용자가 30초 동안 시나리오를 반복합니다.
export const options = {
    vus: 1000,
    duration: '30s',
    thresholds: {
        'http_req_failed': ['rate<0.01'], // HTTP 요청 실패율은 1% 미만
        'http_req_duration': ['p(95)<1000'], // 95%의 요청은 1초(1000ms) 안에 처리
    },
};

const BASE_URL = 'http://localhost:8080/api';

export default function () {
    let newUserId; // 생성된 사용자의 ID를 저장할 변수

    // ----------------------------------------------------
    // 시나리오 1단계: 고유한 정보로 새로운 사용자 생성 (POST)
    // ----------------------------------------------------
    group('Step 1: Create a New Unique User', function () {
        // __VU와 __ITER를 조합하여 매번 고유한 사용자 정보 생성
        const uniqueUsername = `testuser-${__VU}-${__ITER}`;
        const uniqueEmail = `user-${__VU}-${__ITER}@test.com`;

        const payload = JSON.stringify({
            username: uniqueUsername,
            password: '1234',
            email: uniqueEmail,
        });

        const params = {
            headers: { 'Content-Type': 'application/json' },
        };

        const res = http.post(`${BASE_URL}/users`, payload, params);

        // 응답 코드 확인 및 응답 본문에서 id가 제대로 넘어왔는지 확인
        check(res, {
            'POST /users - status is 201 (Created)': (r) => r.status === 200,
            'POST /users - response has user ID': (r) => r.json('id') !== null,
        });

        // 응답으로 받은 id를 newUserId 변수에 저장 (다음 단계에서 사용)
        if (res.json('id')) {
            newUserId = res.json('id');
        }
    });

    // 다음 단계로 넘어가기 전 잠시 대기
    sleep(1);

    // ----------------------------------------------------
    // 시나리오 2단계 & 3단계: 생성된 사용자를 조회하고 즉시 삭제
    // ----------------------------------------------------
    // newUserId가 성공적으로 할당되었을 때만 다음 단계를 진행합니다.
    if (newUserId) {
        // --- 2단계: 방금 생성한 사용자 정보 조회 (GET) ---
        group('Step 2: Get Created User Info', function () {
            const res = http.get(`${BASE_URL}/users/${newUserId}`);

            check(res, {
                'GET /users/{id} - status is 200': (r) => r.status === 200,
                'GET /users/{id} - response ID matches created ID': (r) => r.json('id') == newUserId,
            });
        });

        sleep(1);

        // --- 3단계: 방금 생성한 사용자 정보 삭제 (DELETE) ---
        group('Step 3: Delete Created User', function () {
            const res = http.del(`${BASE_URL}/users/${newUserId}`);

            // DELETE는 성공 시 200(OK) 또는 204(No Content)를 주로 반환합니다.
            check(res, {
                'DELETE /users/{id} - status is 200 or 204': (r) => [200, 204].includes(r.status),
            });
        });
    }

    // 전체 시나리오가 끝난 후 다음 반복을 위해 1~3초 대기
    sleep(Math.random() * 2 + 1);
}