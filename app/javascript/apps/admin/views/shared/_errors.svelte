<script>
export let attr;
export let errors;
export let message;

$: message = !!errors[attr] ? errors[attr].join(',') : ''
</script>

{#if message != ''}
<span class="error">{ message }</span>
{/if}
