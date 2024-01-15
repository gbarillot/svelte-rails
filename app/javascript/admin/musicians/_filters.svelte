<script>
  import { router } from '@gbarillot/svelte-router'

  export let bands;  
  export let form = {
    name_cont: ''
  }  

  function submitForm() {
    const query = Object.fromEntries(
      Object.entries(form).map(entry => [`q[${entry[0]}]`, entry[1]])
    );

    router.push($router.path, {query: query});
  }
</script>

<section class="ffilters">
  <a href="#/"  class="openable">{ $_('filter') }</a>

  <form on:submit|preventDefault={submitForm} ref="filters" accept-charset="UTF-8" class="card ">  
    <div class="row">      
      <div class="col-xs-12 col-md-6 col-xl-5"> 
        <label for="name">{ $_('musicians.form.name') }</label>    
        <input type="text" bind:value={form.name_cont} id="name" placeholder="name">
      </div> 
  
      <div class="col-xs-12 col-md-6 col-xl-4">     
        <label for="band">{ $_('musicians.form.band') }</label> 
        <select id="band">
          <option value="null">{ $_('any') }</option>
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
        <a  href="#/" class="secondary outline fill">{ $_('reset_filters') }</a>
      </div> 
    </div>
  </form>

</section>
