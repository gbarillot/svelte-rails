import axios from 'axios';

const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const Xhr = axios.create({ baseURL: window.I18n.basePath });

Xhr.defaults.headers.common['X-CSRF-Token'] = csrfToken;
Xhr.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    switch (error.response.status) {
      case 500:
        window.location.href = '/500'
        break;
      case 404:
        window.location.href = '/404'
        break;
      case 401:
        alert('not authenticated')  
        break;
    }
  
    return Promise.reject(error);
  }
);

export { Xhr } 