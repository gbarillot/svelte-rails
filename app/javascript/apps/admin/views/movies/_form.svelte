<script>
  import Errors from '../shared/_errors.svelte'

  export let movie; 
  export let genres;
  export let errors;
</script>

<fieldset>
  <label for="name">{ $_('movies.form.name') }</label>
  <Errors attr="name"  errors={errors} />
  <input id="name" type="text" bind:value={movie.name}>
</fieldset>

<fieldset>
  <label for="description">{ $_('movies.form.description') }</label>
  <Errors attr="description"  errors={errors} />
  <input id="description" type="text" bind:value={movie.description}>
</fieldset>

<fieldset>
  <label for="genre">{ $_('movies.form.genre') }</label>
  <Errors attr="genre" errors={errors} />
  <select id="genre" bind:value={movie.genre_id}>
    {#each genres as genre}
      <option value={genre.id}>{ genre.name }</option>
    {/each}
  </select>
</fieldset>  

<div class="row slider-rating">
  <fieldset>
    <label for="rating">{ $_('movies.form.rating') }</label>
    <input id="rating" type="range" min="1" max="5" bind:value={movie.rating} />    
  </fieldset>  
  <b>{ movie.rating} </b>
</div>

<div class="row release-restricted">
  <fieldset>
    <label for="release">{ $_('movies.form.release_date') }</label>
    <input id="release" type="date" bind:value={movie.released_at} />
  </fieldset> 

  <fieldset class="">
    <label for="restricted">{ $_('movies.form.restricted') }</label>
    <input type="radio" bind:group={movie.restricted} value="true" />Yes
    <input type="radio" bind:group={movie.restricted} value="false" />No
  </fieldset>  
</div>