import { Xhr } from '@/support/xhr.js'

const Store = writable({
  musicians: [],
  musician: {
    id: null,
    name: '',
    band: ''
  }
});

const Api = readable({
  index: async () => {  
    await Xhr.get(`/musicians`).then((response) => {
      Store.update((storeData) => {
        storeData.musicians = response.data.musicians;
        return storeData;
      });
    })
  },
  show: async (id) => {
    await Xhr.get(`/musicians/${id}`).then((response) => {
      Store.update((storeData) => {
        storeData.musician = response.data.musician;
        return storeData;
      });
    })
  }
})

export { Store, Api }

