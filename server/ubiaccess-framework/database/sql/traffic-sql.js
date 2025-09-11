module.exports = {
  traffic_list_all: {
    sql: `select *
          from test_springboot.springboot_traffic`,
  },

  traffic_list: {
    sql: `select * 
                from test_springboot.springboot_traffic`,
                
    count: `select count(*) as total 
                  from test_springboot.springboot_traffic`,
    where: ` where # `,
    order: ` order by # `,
    page: ` limit # `,
  },

  traffic_read: {
    sql: `select *
                from test_springboot.springboot_traffic
                where id = :id`,
  },

  //고객 데이터 추가
  traffic_add: {
    sql: `insert into test_springboot.springboot_traffic(req_class, req_method) 
            values
            (:req_class, :req_method)`,
  },



  //고객 데이터 삭제
  traffic_remove: {
    sql: `delete from test_springboot.springboot_traffic
            where id = :id`,
  },
};
