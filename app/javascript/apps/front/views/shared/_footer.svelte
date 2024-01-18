<script>
const setTheme = ((theme) => {
  let root = document.querySelector('html');
  root.setAttribute('data-theme', theme);
  document.cookie = `theme=${theme}; path=/`;
})

const getCookie = ((name) => {
  let value = '; ' + document.cookie;
  let parts = value.split(`; ${name}=`);
  if (parts.length == 2) return parts.pop().split(';').shift();
})

onMount(async () => {
  const theme = getCookie('theme');
  theme ? setTheme(theme) : setTheme('light');
})
</script>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-lg-8">
                Guillaume Barillot 2024 -
                <a href="https://github.com/gbarillot">Github</a> |
                <a href="https://twitter.com/gbarillot">Twitter</a>
            </div>
            <div class="col-xs-12 col-lg-4 ta-right">
                <b>Theme: </b>
                <a href={'#'} on:click|preventDefault={() => setTheme('light')}>light</a> |
                <a href={'#'} on:click|preventDefault={() => setTheme('dark')}>dark</a>
            </div>
        </div>
    </div>
</footer>
