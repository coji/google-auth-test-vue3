<script setup lang="ts">
import { decodeCredential } from "vue3-google-login";
import { ref } from "vue";

const user = ref(null);

const callback = (response) => {
  console.log("Handle the response", response);
  const userData = decodeCredential(response.credential);
  console.log("Handle the userData", userData);

  // ログイン
  user.value = userData;
  console.log({ user: user.value });
};

const logout = () => {
  user.value = null;
};
</script>

<template>
  <h1>Google Auth Test</h1>

  <div v-if="user">
    <p>ログインしました</p>
    <code>
      <pre>{{ JSON.stringify(user, null, 2) }}</pre>
    </code>

    <button @click="logout">Logout</button>
  </div>

  <div v-else>
    <GoogleLogin :callback="callback" />
  </div>
</template>
