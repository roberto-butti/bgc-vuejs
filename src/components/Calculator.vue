<template>

<b-panel :collapsible="isCollapsible">
    <strong slot="header">Bike Gear Calculator</strong>
    <div class="content">
        <div class="columns">
            <div class="column">
                <b-field label="Numero di pedalate per minuto:">
                    <b-input  v-model.number="rpm" type="number" size="is-large"></b-input>
                </b-field>
            </div>
            <div class="column">
                <b-field label="Numero di denti sulla corona anteriore:">
                    <b-input  v-model.number="crankset" type="number" size="is-large"></b-input>
                </b-field>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <b-field label="Numero di denti sul pignone posteriore: ">
                    <b-input v-model.number="cassette" type="number" size="is-large"></b-input>
                </b-field>
            </div>
            <div class="column">
                <b-field label="Circonferenza in millimetri della ruota posteriore:">
                    <b-input v-model.number="diameter_wheel" type="number" size="is-large"></b-input>
                </b-field>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <img v-bind:style="{ animation:  'spin '+ (60/rpm) +'s linear infinite'}" src="../assets/img/bike-crankset.svg" width="64" alt="Crankset"/>
            </div>
            <div class="column">
                <img v-bind:style="{ animation:  'spin '+ (1/((crankset/cassette)*rpm/60)) +'s linear infinite'}" src="../assets/img/ruota.svg" width="64" alt="Wheel Diameter"/>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                Impieghi {{ 1/(rpm/60) }} secondi per fare una pedalata completa.
            </div>
            
            <div class="column">
                Gear Ratio: {{ crankset/cassette }}
            </div>
            <div class="column">
                Wheel RPM: {{ (crankset/cassette)*rpm }}
            </div>

            <div class="column">
                Impieghi {{ 1/((crankset/cassette)*rpm/60) }} secondi per un giro di ruota
            </div>
            <div class="column">
                Km/h: {{ (((crankset/cassette)*diameter_wheel*rpm)/1000000)*60 }}
            </div>
        </div>
    </div>
</b-panel>
</template>

<script>
export default {
data () {
    return {
        rpm:70,
        crankset:50,
        cassette:18,
        diameter_wheel:2098.58 // ( 622 + 23 + 23 ) * PI
        }
      
  }
}
</script>

<style>

@-moz-keyframes spin { 100% { -moz-transform: rotate(360deg); } }
@-webkit-keyframes spin { 100% { -webkit-transform: rotate(360deg); } }
@keyframes spin { 100% { -webkit-transform: rotate(360deg); transform:rotate(360deg); } }
    
</style>