import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import { svelte as Svelte } from '@sveltejs/vite-plugin-svelte'
import AutoImport from 'unplugin-auto-import/vite'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    Svelte({
    }),
    AutoImport({
      imports: [
        'svelte',
        'svelte/store',
        {
          from: 'svelte-i18n',
          imports: ['_']
        },
        {
        'axios': [
          ['default', 'axios']
        ]
        }
      ]
    })
  ],
  build: {
    target: 'esnext' 
  },
  server: {
    hmr: {
      host: "localhost",
      port: 3036,
      protocol: "ws"
    },
  }
})
