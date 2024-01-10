import axios from 'axios';

const localePrefix = window.I18n.prefix === '' ? '' : `${window.I18n.prefix}/`;
const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const Api = axios.create({
  baseURL: `${window.location.protocol}/${localePrefix}api`
});

Api.defaults.headers.common['X-CSRF-Token'] = csrfToken;
Api.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    switch (error.response.status) {
      case 500:
        window.location.href = '/500'
        break;
      case 401:
        alert('not authenticated')  
        break;
    }
  
    return Promise.reject(error);
  }
);

export { Api } 