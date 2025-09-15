USE `test_springboot`;

SELECT 
    id,
    req_time,
    LAG(req_time) OVER (ORDER BY req_time) AS prev_req_time,
    TIMESTAMPDIFF(MICROSECOND, LAG(req_time) OVER (ORDER BY req_time), req_time) / 1000 AS diff_ms
FROM 
    springboot_traffic;




use test_springboot;

alter table springboot_traffic auto_increment = 1;

SELECT * FROM test_springboot.springboot_traffic;


delete from springboot_traffic
where id > 0;

