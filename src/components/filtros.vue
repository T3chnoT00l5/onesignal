<template>
  <div>
          <div class="column is-6 is-offset-3">
        <form class="box" @submit.prevent="enviar">

        <div class="column is-10 px-0">
        <div class="field is-horizontal">
            <div class="column is-2 px-0">
            <div class="field-label is-normal">
                <label class="label  is-pulled-left">Municipio:</label>
            </div>
            </div>
            <div class="column is-10 is-offset-0-desktop is-offset-2-tablet px-0">
            <div class="field-body">
            <div class="field">
                <div class="control is-expanded">
                    <div class="control has-icons-left">
                        <div class="select is-fullwidth">
                            <select v-model="formulario.municipio" required>
                                <option v-for="elemento in municipios" :key="elemento" :value="elemento">{{elemento}}</option>
                            </select>
                            <div class="icon is-small is-left">
                                <i class="fas fa-globe"></i>
                            </div>
                        </div>                
                    </div>
                </div>
            </div>
            </div>
            </div>
        </div>
        </div>

        <div class="column is-10 px-0">
        <div class="field is-horizontal">
            <div class="column is-2 px-0">
            <div class="field-label is-normal">
                <label class="label is-pulled-left">Trayecto:</label>
            </div>
            </div>
            <div class="column is-10 is-offset-0-desktop is-offset-2-tablet px-0">
            <div class="field-body">
            <div class="field">
                <div class="control is-expanded">
                    <div class="control has-icons-left">
                        <div class="select is-fullwidth">
                            <select v-model="formulario.trayecto">
                                <option v-for="elemento in trayectos" :key="elemento" :value="elemento">{{elemento}}</option>
                            </select>
                            <div class="icon is-small is-left">
                                <i class="fas fa-graduation-cap"></i>
                            </div>
                        </div>                
                    </div>
                </div>
            </div>
            </div>
            </div>
        </div>
        </div>

        <div class="field">
  <label class="label  is-pulled-left">Mensaje:</label>
  <div class="control">
    <textarea class="textarea has-fixed-size"  v-model="formulario.msg" required placeholder="Escribe el mensaje que deseas enviar"></textarea>
  </div>
</div>

{{formulario}}
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
    name: 'filtros',
    data(){
      return{
        loading: false,
        msgPHP: '',
        municipios:[
           "25 de Mayo",
"Alba Posse",
"Almafuerte",
"Apóstoles",
"Aristóbulo del Valle",
"Azara",
"Bernardo de Irigoyen",
"Caá Yarí",
"Campo Grande",
"Campo Ramón",
"Campo Viera",
"Candelaria",
"Capioví",
"Cerro Azul",
"Cerro Corá",
"Colonia Alberdi",
"Colonia Aurora",
"Colonia Delicia",
"Colonía Victoria",
"Comandante Andresito",
"Concepción de la Sierra",
"Corpus",
"Dos de Mayo",
"El Alcazar",
"El Soberbio",
"Eldorado",
"Fachinal",
"Garuhape",
"Garupá",
"General Urquiza",
"Gobernador Roca",
"Guaraní",
"Jardín América",
"Leandro N. Alem",
"Loreto",
"Los helechos",
"Montecarlo",
"Oberá",
"Panambí",
"Posadas (En el Polo TIC)",
"Pozo Azul",
"Profundidad",
"Puerto Esperanza",
"Puerto Iguazú",
"Puerto Libertad",
"Puerto Piray",
"Puerto Rico",
"Ruiz de Montoya",
"Salto Encantado",
"San Ignacio",
"San Javier",
"San José",
"San Martín",
"San Pedro",
"San Vicente",
"Santa Ana",
"Santiago de Liniers",
"Santo Pipó"
        ],
        trayectos:[
            "2021 - TrendKids Básico Normal",
"2021 - TrendKids Avanzado Normal",
"2021 - TecnoKids Básico Transición",
"2021 - TecnoKids Básico Normal",
"2021 - TecnoKids Avanzado Normal",
"2021 - MakerJuniors Básico Transición",
"2021 - MakerJuniors Básico Normal",
"2021 - MakerJuniors Avanzado Normal",
"2021 - TeensMaker Básico Transición",
"2021 - TeensMaker Básico Normal",
"2021 - TeensMaker Avanzado Normal",
"2021 - TeamInn Básico Transición",
"2021 - TeamInn Básico Normal",
"2021 - TeamInn Avanzado Normal",
"2021 - HighMaker Básico Transición",
"2021 - HighMaker Básico Normal",
"2021 - HighMaker Avanzado Normal"
        ],
        formulario:{}
      }
    },
    watch:{
      msgPHP:function(val){
        if (val.length > 0){
                  console.log("enviado!");
                  this.formulario = {} 
        }
      }
    },
methods:{
    enviar(){
  this.datosPHP('mensajillo').then((result) =>this.msgPHP = result);
},
        async datosPHP(que){
        var self = this;
        self.loading = true;
        let response = await axios.post('filtros.php',{que:que, formu: this.formulario});
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