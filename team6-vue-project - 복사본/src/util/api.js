import axios from "axios";
import { requestConfig } from "../../app.config";

export const api = axios.create({
  //baseURL: "http://localhost:8001/api/post",
  baseURL: requestConfig.baseUrl + "/api/post",
  timeout: 15000,
  headers: { "Content-Type": "application/json" },
});
export const api_ai = axios.create({
  //baseURL: "http://localhost:8001/api/post",
  baseURL: requestConfig.baseUrlDocker,
  timeout: 15000,
  headers: { "Content-Type": "multipart/form-data" },
});