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