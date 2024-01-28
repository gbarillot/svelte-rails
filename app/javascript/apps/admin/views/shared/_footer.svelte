<script>
onMount(async () => {
  const theme = window.getCookie('theme');
  theme ? window.setTheme(theme) : window.setTheme('light');
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
            <div class="col-xs-12 col-lg-4">
                <b>Theme: </b>
                <a href={'#'} on:click|preventDefault={() => setTheme('light')}>light</a> |
                <a href={'#'} on:click|preventDefault={() => setTheme('dark')}>dark</a>
            </div>
        </div>
    </div>
</footer>
