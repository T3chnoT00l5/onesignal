<template>
  <div>
          <div class="column is-6 is-offset-3">
        <form class="box"  @submit.prevent="enviar">
            <h3 class="has-text-grey">En esta sección puedes ver los usuarios registrados en la plataforma!</h3>
            <input type="text" v-model="search">
            <div class="box" v-for="user in users" :key="user.id">
                <div v-on:click="modal(user.id)">{{user.tags}}</div>
                </div>

        <div class="field is-grouped is-grouped-centered">
  <div class="control" v-if="loading" style="margin-top: -30px;">
    <spinner/>
  </div>
</div>



        </form>
    </div>


<div class="modal" ref="modal">
  <div class="modal-background"></div>
  <div class="modal-card">
    <header class="modal-card-head">
      <p class="modal-card-title">Modal title</p>
      <button class="delete" @click="cerrar" aria-label="close"></button>
    </header>
    <section class="modal-card-body">
      Nombre: usuario
      <br />
      Dni: 12313
      <br />
      municipio: Candelaria
    </section>
    <footer class="modal-card-foot">
      <button class="button is-success">Save changes</button>
      <button class="button">Cancel</button>
    </footer>
  </div>
</div>

  </div>
</template>

<script>
import axios from 'axios'
export default {
    name: 'ver',
    data(){
      return{
        msgPHP: {players:[]},
        search:'',
        //editar: -1,
        loading: false
      }
    },
    created: function() {
      var vm = this;
      //console.log("im ready"); Tecla ESC para cerrar modal
      window.addEventListener('keyup', function(event) {
        if (event.keyCode == 27) { 
          if (vm.$refs.modal) {
         if(vm.$refs.modal.classList.contains('is-active')){
          vm.cerrar();
          console.log("escape");
          }
          }
      }
      });
    },
    mounted(){
        this.enviar();
        console.log("llamado");
    },
methods:{
    enviar(){
  this.datosPHP().then((result) =>this.msgPHP = result);
},
modal(quien){
  //obtener el indice de quien edito
    //let indice = this.msgPHP.players.map(u => u.id).indexOf(this.msgPHP.players[quien].id);
    //this.editar = indice;
    this.$refs.modal.classList.add('is-active');
    console.log(this.$refs.modal)
console.log(quien)
},
cerrar(){
this.$refs.modal.classList.remove('is-active');
},
        async datosPHP(){
        var self = this;
        self.loading = true;
        let response = await axios.post('notificaciones/onesignal/ver.php');
        if(response.data.length != 0){
                    self.loading = false;
                    console.log(response.data)
                    return response.data;   
                }else{
                  self.loading = false;
                  return [];
                }
        }
},
    computed: {
        users(){
            return this.msgPHP.players.filter((user) => {
                return (user.tags.dni.includes(this.search));
            });
        }
    }
}
</script>

<style>

</style>