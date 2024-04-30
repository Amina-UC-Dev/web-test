importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: 'AIzaSyC8ZDi1EevgrZY3H0YBIFqXAgnoG-rV0Wk',
      appId: '1:747993344827:web:16324c39210c4bffbce51e',
      messagingSenderId: '747993344827',
      projectId: 'jazenetbeonchatdev',
      authDomain: 'jazenetbeonchatdev.firebaseapp.com',
      storageBucket: 'jazenetbeonchatdev.appspot.com',
      measurementId: 'G-NMMJ0VFJ6C',
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});