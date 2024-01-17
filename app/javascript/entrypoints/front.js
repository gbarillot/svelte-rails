import Layout from '../apps/front/app.svelte';
import { addMessages, init } from 'svelte-i18n';

addMessages('en', translations);
init({
  fallbackLocale: 'en',
  initialLocale: 'en'
});

const app = new Layout({
	target: document.getElementById('app')
});

export default app;