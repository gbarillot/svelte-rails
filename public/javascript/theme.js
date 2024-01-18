var setTheme = ((theme) => {
  let root = document.querySelector('html');
  root.setAttribute('data-theme', theme);
  document.cookie = `theme=${theme}; path=/`;
})

var getCookie = ((name) => {
  let value = '; ' + document.cookie;
  let parts = value.split(`; ${name}=`);
  if (parts.length == 2) return parts.pop().split(';').shift();
})