<template>
  <div>
          <div class="column is-6 is-offset-3">
        <form class="box"  @submit.prevent="enviar">
            <h3 class="has-text-grey">En esta sección enviarás un mensaje a todos los dispositivos que tengan instalada la aplicación</h3>

        <div class="field">
  <label class="label  is-pulled-left">MensajesF:</label>
  <div class="control">
    <textarea class="textarea has-fixed-size" v-model="formulario.msg" placeholder="Escribe el mensaje que deseas enviar"></textarea>
  </div>
</div>

        <div class="field is-grouped is-grouped-centered">
  <div class="control">
    <button type="submit" @submit.prevent="enviar" :disabled="loading" class="button is-primary">Enviar!</button>
  </div>
  <div class="control" v-if="loading" style="margin-top: -30px;">
    <spinner/>
  </div>
</div>

        </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
    name: 'todos',
    data(){
      return{
        msgPHP: '',
        loading: false,
        formulario:{}
      }
    },
methods:{
    enviar(){
  this.datosPHP('Todos').then((result) =>this.msgPHP = result);
},
        async datosPHP(que){
        var self = this;
        self.loading = true;
        let response = await axios.post('todos.php',{que:que, formu: this.formulario});
        if(response.data.length != 0){
                    self.loading = false;
                    return response.data;   
                }else{
                  self.loading = false;
                  return [];
                }
        }
}
}
</script>

<style>

</style>