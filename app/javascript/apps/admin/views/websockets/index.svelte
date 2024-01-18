<script>
import {
  _
} from 'svelte-i18n'
import {
  Link
} from '@gbarillot/svelte-router'
import Chat from '../../stores/chat';

export let message = '';

function publish() {
  Chat.send(message);
  message = '';
}
</script>

<section class="container websockets">
    <ul class="breadcrumb">
        <li><Link to="root">{ $_('title') }</Link></li>
        <li>{ $_('nav.websockets') }</li>
    </ul>

    <div class="row">
        <div class="col-xs-12 col-md-6">
            <form on:submit|preventDefault={publish} accept-charset="UTF-8">
                <input type="input" bind:value={message} placeholder={$_('websockets.placeholder')} />
                <input type="submit" value={$_('websockets.publish')} />
            </form>

            <div class="card hidden-xs hidden-sm hidden-md hidden-lg">
                <p>{ $_('websockets.comment1') }</p>
                <code>{ $_('websockets.code_example') }</code>
                <br /><br />
            </div>
            <br />
        </div>

        <div class="col-xs-12 col-md-6 card">
            <p>{ $_('websockets.comment2') }
                <b>{ $_('websockets.server_side') }</b>
                { $_('websockets.comment3') }
            </p>

            {#if $Chat.messages.length > 0}
            {#each $Chat.messages.reverse() as message}
            <p><i>{ message }</i></p>
            {/each}
            {:else}
            <p><i>{ $_('websockets.waiting_messages') }</i></p>
            {/if}
            
        </div>
    </div>
</section>
