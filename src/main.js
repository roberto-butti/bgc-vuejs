import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  base: __dirname,
  routes: [
    { path: '/', name: 'home', component: App },
    
//    { path: '/foo', name: 'foo', component: Foo },
//    { path: '/bar/:id', name: 'bar', component: Bar }
  ]
})

const app = new Vue({
  router,
  render: h => h(App)
}).$mount('#app')






