<template>
  <div>
        <form class="notification"  @submit.prevent="enviar">
            <h3 class="has-text-grey">En esta sección puedes ver los usuarios registrados en la plataforma!</h3>
            <div class="field has-addons is-justify-content-center">
              <p class="control">
                <input class="input" v-model="search" type="text" placeholder="Busca por DNI">
              </p>
              <p class="control">
                <a class="button is-static">
                <i class="fas fa-search" aria-hidden="true"></i>
                </a>
              </p>
            </div>
            <div class="columns is-justify-content-space-evenly is-multiline">
                <div class="column is-narrow" v-for="user in users" :key="user.id">
                  <div class="box m-5" @click="modal(user)">
                      <div class="field is-flex is-flex-wrap-wrap-mobile">
                          <label class="label px-2 py-1 m-0 is-medium">
                            <span class="icon-text  has-text-grey mt-1 mr-1 is-flex is-flex-wrap-nowrap">
                              <i class="fas fa-address-card"></i> 
                              <span>DNI:</span>
                            </span>
                            
                        </label>
                          <div class="control column p-0">
                            <div type="text" class="input has-text-weight-bold notification is-info is-light">{{user.tags.dni}}</div> 
                          </div>
                        </div>

                      <div class="field is-flex is-flex-wrap-wrap">
                          <label class="label px-2 py-1 m-0 is-medium">
                            <span class="icon-text  has-text-grey mt-1 mr-1 is-flex is-flex-wrap-nowrap">
                              <i class="fas fa-graduation-cap"></i> 
                              <span>Trayecto:</span>
                            </span>
                            
                        </label>
                          <div class="control column p-0">
                            <div type="text" class="input has-text-weight-bold notification is-info is-light">{{user.tags.trayecto}}</div> 
                          </div>
                        </div>

                      <div class="field is-flex is-flex-wrap-wrap">
                          <label class="label px-2 py-1 m-0 is-medium">
                            <span class="icon-text  has-text-grey mt-1 mr-1 is-flex is-flex-wrap-nowrap">
                              <i class="fas fa-map-marked-alt"></i> 
                              <span>Municipio:</span>
                            </span>
                            
                        </label>
                          <div class="control column p-0">
                            <div type="text" class="input has-text-weight-bold notification is-info is-light">{{user.tags.municipio}}</div> 
                          </div>
                        </div>
                  </div>
                </div>
            </div>

        <div class="field is-grouped is-grouped-centered">
  <div class="control" v-if="loading" style="margin-top: -30px;">
    <spinner/>
  </div>
</div>



        </form>

<div v-if="msgPHP.players.length > 0 && editar >= 0">
<div class="modal" ref="modal">
  <div class="modal-background" @click="cerrar"></div>
  <div class="modal-card">
    <header class="modal-card-head">
      <p class="modal-card-title">{{msgPHP.players[editar].id}}</p>
      <button class="delete" @click="cerrar" aria-label="close"></button>
    </header>
    <section class="modal-card-body">



<div class="column is-8 is-offset-2">

<div class="field is-grouped">
    <div class="field-label column is-3 column is-3 is-normal mr-0">
        <label class="label">Dni:</label>
      </div>
      <div class="field-body">
        <input class="input is-pulled-left" type="text" v-model="formu.dni">
      </div>
  </div>

  <div class="field is-grouped">
    <div class="field-label column is-3 is-normal mr-0">
        <label class="label">Trayecto:</label>
      </div>
      <div class="field-body">
        <input class="input is-pulled-left" type="text" v-model="formu.trayecto">
      </div>
  </div>
  
  <div class="field is-grouped">
    <div class="field-label column is-3 is-normal mr-0">
        <label class="label">Municipio:</label>
      </div>
      <div class="field-body">
        <input class="input is-pulled-left" type="text" v-model="formu.municipio">
      </div>
  </div>

  <div class="field is-grouped">
    <div class="field-label column is-3 is-normal mr-0">
        <label class="label">Espacio:</label>
      </div>
      <div class="field-body">
        <input class="input is-pulled-left" type="text" v-model="formu.espacio">
      </div>
  </div>

  <div class="field is-grouped">
    <div class="field-label column is-3 is-normal mr-0">
        <label class="label">Sede:</label>
      </div>
      <div class="field-body">
        <input class="input is-pulled-left" type="text" v-model="formu.sede">
      </div>
  </div>

  <div class="field is-grouped">
    <div class="field-label column is-3 is-normal mr-0">
        <label class="label">Día:</label>
      </div>
      <div class="field-body">
        <input class="input is-pulled-left" type="text" v-model="formu.dia">
      </div>
  </div>

  <div class="field is-grouped">
    <div class="field-label column is-3 is-normal mr-0">
        <label class="label">Horario:</label>
      </div>
      <div class="field-body">
        <input class="input is-pulled-left" type="text" v-model="formu.horario">
      </div>
  </div>


</div>


    </section>
    <footer class="modal-card-foot is-justify-content-flex-end">
      <button class="button is-success" @click="guardar">Guardar</button>
      <button class="button" @click="cerrar">Cancelar</button>
    </footer>
  </div>
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
        formu:{},
        search:'',
        editar: -1,
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
guardar(){
this.datosPHP('guardar').then((result) =>{
//console.log(result)
if(result.success){
  console.log("correcto");
  this.msgPHP.players[this.editar].tags = this.formu;

  }
}
);
},
modal(quien){
  //obtener el indice de quien edito
  //console.log(quien)
      let indice = this.msgPHP.players.indexOf(quien);
      this.editar = indice;
      this.formu = {};
      let temp = Object.assign({},this.msgPHP.players[indice].tags);
      this.formu = temp;
      //this.formu.iduser = this.msgPHP.players[indice].id;
      this.$nextTick(function () {
       this.$refs.modal.classList.add('is-active');
      })
      

},
cerrar(){
//this.$nextTick(function () {
let temp = Object.assign({},{});
this.formu = temp;
this.$refs.modal.classList.remove('is-active');
//})
},
        async datosPHP(que){
        var self = this;
        self.loading = true;
        let response;
        if(que){        
          response = await axios.post('editarusuario.php',{userid: this.msgPHP.players[this.editar].id, formu:this.formu});
        }else{
          response = await axios.post('ver.php');
        }
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
          
            //console.log(this.msgPHP.players);
            return this.msgPHP.players.filter((user) => {
              //console.log(user.tags.dni); //si no tiene dni da error por undefined del filtro....
              if(user.tags.dni){
                return (user.tags.dni.includes(this.search))
              }else{
                return user;
              }
            });
            
        }
    }
}
</script>

<style>

</style>