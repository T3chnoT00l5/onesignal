<template>
  <div>
    <div class="container is-fluid">
        <div class="notification is-danger">
            Pagina de administración para enviar Notificaciones a la Aplicacion de la red Maker.
        </div>


<div class="tabs is-centered is-boxed is-medium">
  <ul>
     <li v-bind:class="{ 'is-active': activo == 'todos' }">
      <a v-on:click="activo = 'todos'">
        <span class="icon is-small"><i class="fas fa-globe-americas" aria-hidden="true"></i></span>
        <span>Todos </span>
      </a>
    </li>
    <li v-bind:class="{ 'is-active': activo == 'filtros' }">
      <a v-on:click="activo = 'filtros'">
        <span class="icon is-small"><i class="fas fa-filter" aria-hidden="true"></i></span>
        <span>Filtro</span>
      </a>
    </li>

    <li v-bind:class="{ 'is-active': activo == 'ver' }">
      <a v-on:click="activo = 'ver'">
        <span class="icon is-small"><i class="fas fa-search" aria-hidden="true"></i></span>
        <span>Ver</span>
      </a>
    </li>
  </ul>
</div>
<keep-alive include="ver">
  <component v-bind:is="activo"></component>
</keep-alive>

 
        
    </div> 
</div>
</template>

<script>
import filtros from '@/components/filtros.vue';
import todos from '@/components/todos.vue';
import ver from '@/components/ver.vue';
export default {
    name:'control',
    data(){
    return{
        activo:'todos'
    }
    },
    components:{
    filtros,
    todos,
    ver
}
}
</script>

<style>
@import "~bulma/css/bulma.css";
.tab-contents .content {
  display: none;
}
.tab-contents .content.is-active {
  display: block;
}
</style>