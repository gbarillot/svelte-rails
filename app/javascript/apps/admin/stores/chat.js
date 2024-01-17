import { writable } from 'svelte/store';
import { createConsumer } from "@rails/actioncable";

const protocol = window.location.protocol === 'https:' ? 'wss' : 'ws';
const consumer = createConsumer(`${protocol}://${window.location.host}/cable`);

function createChat() {
  const { subscribe, update } = writable({
    messages: [],
  });

  let channel = null;
  if (channel === null) {
    channel = consumer.subscriptions.create({ channel: 'ChatChannel' }, {
      received(data) {
        update((state) => ({
          ...state,
          messages: [...state.messages, data.message],
        }));
      },
    });
  }

  function send(message) {
    channel.send({ message: message });
  }

  return {
    subscribe,
    send,
  };
}

const Chat = createChat();

export default Chat;