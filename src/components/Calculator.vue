<template>
  
<div class="box is-info">
    <p>

Numero di pedalate per minuto:
<input v-model.number="rpm" type="number">
<br />
Numero di denti sulla corona anteriore: 
<input v-model.number="crankset" type="number">
<img v-bind:style="{ animation:  'spin '+ (60/rpm) +'s linear infinite'}" src="../assets/img/bike-crankset.svg" width="64" alt="Crankset"/>
<br />
Impieghi {{ 60/rpm }} secondi per fare una pedalata completa.
<br />
Numero di denti sul pignone posteriore: 
<!-- img v-bind:style="{ animation:  'spin '+ (60/rpm) +'s linear infinite'}" src="../assets/img/bike-gears.svg" width="64" alt="Gears (Casette)"/ -->
<input v-model.number="cassette" type="number">
<br />
Circonferenza in millimetri della ruota posteriore:
<input v-model.number="diameter_wheel" type="number">

<img class="imagewheelrotate" src="../assets/img/bike-spokes.svg" width="64" alt="Wheel Diameter"/>


{{ rpm }}
{{ crankset }}
{{ cassette }}
{{ diameter_wheel }}
{{ crankset/cassette }}
{{ (((crankset/cassette)*diameter_wheel*rpm)/1000000)*60 }} kilometer per hour


    </p>
</div>
</template>

<script>
export default {
data () {
    return {
        rpm:70,
        crankset:50,
        cassette:11,
        diameter_wheel:2098.58 // ( 622 + 23 + 23 ) * PI
        }
      
  }
}
</script>

<style>
.imagewheelrotate {
    /* position: absolute; 
    top: 50%;
    left: 50%;
    width: 120px;
    height: 120px;
    
    margin:-60px 0 0 -60px;
    */
    -webkit-animation:spin 4s linear infinite;
    -moz-animation:spin 4s linear infinite;
    animation:spin 4s linear infinite;
}
.imagepedalrotate {

    -webkit-animation:spin 2s linear infinite;
    -moz-animation:spin 2s linear infinite;
    syh ki:spin 2s linear infinite;
}
@-moz-keyframes spin { 100% { -moz-transform: rotate(360deg); } }
@-webkit-keyframes spin { 100% { -webkit-transform: rotate(360deg); } }
@keyframes spin { 100% { -webkit-transform: rotate(360deg); transform:rotate(360deg); } }
    
</style>