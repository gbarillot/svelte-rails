import { Xhr } from '@/support/xhr.js'

const Store = writable({
  metrics: {}
});

const Api = readable({
  index: async () => {  
    await Xhr.get(`/tooling`).then((response) => {
      Store.update((storeData) => {
        storeData.metrics = response.data.metrics;
        return storeData;
      });
    })
  }
})

export { Store, Api }

