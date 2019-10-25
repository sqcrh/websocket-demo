<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

<template>
  <div id="app">
    <p v-if="connected">We're connected to the server!</p>
    <p v-else>Not connected =(</p>
    <div>
      <input type="text" v-model="input"><button @click="send()">Send</button>
    </div>
    <div style="margin: 15px;">
      Server: {{reply}}
    </div>
  </div>
</template>

<script>

export default {
  name: 'app',
  data() {
    return {
      connected: false,
      reply: '',
      input: '',
    }
  },
  methods: {
    send() {
      this.$socket.emit('message', this.input)
    }
  },
  sockets: {
    connect() {
      console.log('connected');
      this.connected = true;
    },

    disconnect() {
      console.log('connected');
      this.connected = false;
    },

    message(data) {
      console.log('received', data);
      this.reply = data;
    }
  },
}
</script>
