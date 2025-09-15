const logger = require("../util/logger");

const Database = require("../database/database_mysql");

const DatabaseHelper = require("../util/database_helper");
const ControllerHelper = require("../util/controller_helper");

const trafficSql = require("../database/sql/traffic-sql");

/**
 * @Controller(path='/api/traffic')
 */
module.exports = class Traffic {
  constructor() {
    this.database = new Database("database_mysql");

    this.databaseHelper = new DatabaseHelper(this.database);
    this.controllerHelper = new ControllerHelper(this.database);
  }

  ///
  /// 모든 데이터 조회하기
  ///

  /**
   * @RequestMapping(path="/list-all", method="get,post")
   */
  async listAll(req, res) {
    logger.debug(`Traffic::listAll 호출됨`);

    const sqlName = "traffic_list_all";
    this.controllerHelper.execute(req, res, sqlName);
  }

  ///
  /// 리스트 조회하기 (페이지 단위로 조회하기)
  ///

  /**
   * @RequestMapping(path="/list", method="get,post")
   */
  async list(req, res) {
    logger.debug(`Traffic::list 호출됨`);

    const sqlObj = trafficSql.traffic_list;
    this.controllerHelper.executeList(req, res, sqlObj);
  }

  ///
  ///
  ///

  /**
   * @RequestMapping(path="/read", method="get,post")
   */
  async read(req, res) {
    logger.debug(`Traffic::read 호출됨`);

    const sqlName = "traffic_read";
    this.controllerHelper.execute(req, res, sqlName);
  }

  ///
  /// 추가하기
  ///

  /**
   * @RequestMapping(path="/add", method="get,post")
   */
  async add(req) {
    logger.debug(`Traffic::add 호출됨`);

    const sqlName = "traffic_add";
    this.controllerHelper.executeNores(req,sqlName);
  }


  ///
  /// 삭제하기
  ///

  /**
   * @RequestMapping(path="/remove", method="get,post")
   */
  async remove(req, res) {
    logger.debug(`Traffic::remove 호출됨`);

    const sqlName = "traffic_remove";
    this.controllerHelper.execute(req, res, sqlName);
  }
};
