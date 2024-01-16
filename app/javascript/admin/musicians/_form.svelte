<script>
  import Errors from '@/admin/shared/_errors.svelte'

  export let musician; 
  export let bands;
  export let errors;
</script>

<fieldset>
  <label for="name">{ $_('musicians.form.name') }</label>
  <Errors attr="name"  errors={errors} />
  <input id="name" type="text" bind:value={musician.name}>
</fieldset>

<fieldset>
  <label for="bands">{ $_('musicians.form.band') }</label>
  <Errors attr="band" errors={errors} />
  <select id="bands" bind:value={musician.band}>
    {#each bands as band}
      <option value={band.key}>{ band.name }</option>
    {/each}
  </select>
</fieldset>   