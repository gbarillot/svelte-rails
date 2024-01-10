import { Api } from '@/support/api.js'

export const Store = writable({
  musicians: [],
  musician: {
    id: null,
    name: '',
    band: ''
  },

  index: async () => {  
    await Api.get(`/musicians`).then((response) => {
      Store.update((storeData) => {
        storeData.musicians = response.data.musicians;
        return storeData;
      });
    })
  },
  show: async (id) => {
    await Api.get(`/musicians/${id}`).then((response) => {
      Store.update((storeData) => {
        storeData.musician = response.data.musician;
        return storeData;
      });
    })
  }
});

