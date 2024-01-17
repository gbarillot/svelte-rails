<script>
  import { router } from '@gbarillot/svelte-router'

  export let callback;
  export let bands;  
  export let dropped = false;
  export let form = {
    name_cont: init('q[name_cont]'),
    band_eq: init('q[band_eq]')
  }  

  function init(key) {
    return $router.query[key] ? $router.query[key] : ''
  }

  function reset() {
    router.push($router.path);
    callback();
  }

  function filter() {
    const query = Object.fromEntries(
      Object.entries(form).map(entry => [`q[${entry[0]}]`, entry[1]])
    );

    router.push($router.path, {query: query});
    callback();
  }
</script>

<section class="filters">
  <a href="#/" class="openable" on:click|preventDefault={() => dropped = !dropped} class:open={dropped}>{ $_('filter') }</a>

  <form on:submit|preventDefault={filter} ref="filters" accept-charset="UTF-8" class="card " class:hidden={!dropped}>  
    <div class="row">      
      <div class="col-xs-12 col-md-6 col-xl-5"> 
        <label for="name">{ $_('musicians.form.name') }</label>    
        <input type="text" bind:value={form.name_cont} id="name" placeholder="name">
      </div> 
  
      <div class="col-xs-12 col-md-6 col-xl-4">     
        <label for="band">{ $_('musicians.form.band') }</label> 
        <select id="band" bind:value={form.band_eq}>
          <option value="">{ $_('any') }</option>
          {#each bands as band}
            <option value={band.key}>{ band.name }</option>
          {/each}
        </select>
      </div>

      <div class="col-xs-12 col-md-2 col-xl-3">
        <label for="btn" class="hidden-sm hidden-md hidden-lg">&nbsp;</label>
        <input type="submit" id="btn" class="button button-primary" value={$_('filter')}>
      </div>
      <div class="col-xs-12 col-md-5">
        <a on:click|preventDefault={reset} href="#/" class="secondary outline fill">{ $_('reset_filters') }</a>
      </div> 
    </div>
  </form>

</section>
