<script>
  import Errors from '../shared/_errors.svelte'

  export let movie; 
  export let genres;
  export let errors;

  const convertBase64 = (file) => {
    return new Promise((resolve, reject) => {
        const fileReader = new FileReader();
        fileReader.readAsDataURL(file);

        fileReader.onload = () => {
            resolve(fileReader.result);
        };

        fileReader.onerror = (error) => {
            reject(error);
        };
    });
  };

  const uploadImage = async (event) => {
    const file = event.target.files[0];
    const base64 = await convertBase64(file);
    movie.poster = base64;
    movie.poster_url = base64;
    console.log(base64);
  };

  function clearPoster(e) {
    e.preventDefault();
    movie.poster_url = '';
    movie.poster = null;
  }
</script>

<div class="row">
  <div class="col-xs-12 col-md-4">
    <fieldset>
      <label for="name">{ $_('movies.form.poster') }</label>
      <div class="uploader">
        <a class="delete" href="#/" class:hidden={movie.poster_url == ''} title={ $_('delete') } on:click={clearPoster}>×</a>
        <a class="preview" on:click={clickMe} href='#/' aria="uploader" title="click to upload">
          <span class="placeholder" class:hidden={movie.poster_url != ''}>Cliquez pour ajouter une image</span>          
          <img class="img" src={movie.poster_url} alt="preview" class:hidden={movie.poster_url == ''}/>  
        </a>    
        <input id="poster-handler" type="file" bind:value={movie.poster} on:change={uploadImage}>
      </div>
    </fieldset>
  </div>

  <div class="col-xs-12 col-md-8">
    <fieldset>
      <label for="name">{ $_('movies.form.name') }</label>
      <Errors attr="name" errors={errors} />
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
  </div>
</div>