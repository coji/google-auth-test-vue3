import { createApp } from "vue";
import App from "./App.vue";
import vue3GoogleLogin from "vue3-google-login";

const app = createApp(App);
app.use(vue3GoogleLogin, {
  clientId:
    "3463389808-908bqc6ofbc7eu9lrs14k3sni46akauu.apps.googleusercontent.com",
});
app.mount("#app");
