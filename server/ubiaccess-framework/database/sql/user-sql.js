module.exports = {
  user_list_all: {
    sql: `select * from test_springboot.user`,
  },

  user_list: {
    sql: `select * from test_springboot.user`,
    count: `select count(*) as total
            from test_springboot.user`,
    where: ` where # `,
    order: ` order by # `,
    page: ` limit # `,
  },

  user_read: {
    sql: `
      select *
      from test_springboot.user
      where id = :id
    `,
  },

  user_add: {
    sql: `
    insert into test_springboot.user(username,password,email)
    values
    (:username,:password,:email)
    `,
  },

  user_modify: {
    sql: `
    update test_springboot.user
    set username = :username,
        password = :password,
        email = :email
    where id = :id`,
  },

  user_remove: {
    sql: `
    delete from test_springboot.user
          where id = :id
    `,
  },

};
