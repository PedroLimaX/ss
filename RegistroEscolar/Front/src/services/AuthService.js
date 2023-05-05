import axios from 'axios';

const url = 'http://localhost:4000/api/';

export default {
  async login(credentials) {
    const response = await axios
      .post(url + 'login/', credentials);
    return response.data;
  },
  async signUp(credentials) {
    const response = await axios
      .post(url + 'sign-up/', credentials);
    return response.data;
  },
  async reset(credentials) {
    const response = await axios
      .post(url + 'reset/', credentials);
    return response.data;
  },
  async updatepw(credentials) {
    const response = await axios
      .post(url + 'update-pw/', credentials);
    return response.data;
  },
  
  async getSecretContent() {
    const response = await axios.get(url + 'secret-route/');
    return response.data;
  }
};