import { Xhr } from '@/support/xhr.js'

const Store = writable({
  progress: '',
  errors: {},
  bands: [],
  musician: {},
  musicians: [],
  pagination: {}
});

const Api = readable({
  index: async (fullPath) => {  
    await Xhr.get(fullPath).then((response) => {
      Store.update((storeData) => {
        storeData.musicians = response.data.musicians;
        storeData.bands = response.data.bands;
        storeData.pagination = response.data.pagination;
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

