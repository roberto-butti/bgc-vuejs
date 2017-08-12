<template>
    <div class="section">
        <div class="columns">
            <div class="column">
                <div class="field">
                    <label class="label">Cadence (pedaling rate)<!--Pedalate al minuto--></label>
                    <div class="control">
                        <input class="input is-large" type="number" v-model.number="rpm" placeholder="RPM">
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="field">
                    <label class="label">Chainset<!--Corona anteriore--></label>
                    <div class="control">
                        <input class="input is-large" type="number" v-model.number="crankset" placeholder="Crankset">
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="field">
                    <label class="label">Cassette<!--Pignone posteriore--></label>
                    <div class="control">
                        <input class="input is-large" type="number" v-model.number="cassette" placeholder="Cassette">
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="field">
                    <label class="label">Wheel size mm.<!--Circonferenza ruota (mm.)--></label>
                    <div class="control">
                        <input class="input is-large" type="number" v-model.number="diameter_wheel" placeholder="Diameter Wheel">
                    </div>
                </div>
            </div>
    
        </div>
        <div class="columns">
            <div class="column">
                <p class="stat-val has-text-centered">{{ (1/(rpm/60)).toFixed(2) }} s.</p>
                <p class="stat-key has-text-centered">Seconds for a stroke of pedal<!--Secondi per fare una pedalata completa.--></p>
    
            </div>
    
            <div class="column">
                <p class="stat-val has-text-centered">{{ (crankset/cassette).toFixed(2) }}</p>
                <p class="stat-key has-text-centered">Gear Ratio</p>
            </div>
            <div class="column">
                <p class="stat-val has-text-centered">{{ ((crankset/cassette)*rpm).toFixed(2) }} rpm</p>
                <p class="stat-key has-text-centered">Wheel RPM</p>
            </div>
    
            <div class="column">
                <p class="stat-val has-text-centered">{{ (1/((crankset/cassette)*rpm/60)).toFixed(2) }} s.</p>
                <p class="stat-key has-text-centered">Wheel speed in seconds<!--Secondi per un giro di ruota--></p>
            </div>
            <div class="column">
                <p class="stat-val has-text-centered">{{ ((((crankset/cassette)*diameter_wheel*rpm)/1000000)*60).toFixed(2) }}km/h</p>
                <p class="stat-key has-text-centered">Speed Km/h</p>
            </div>
        </div>    
        <div class="columns">
            <div class="column has-text-centered">
                <img v-bind:style="{ animation:  'spin '+ (1/((crankset/cassette)*rpm/60)) +'s linear infinite'}" src="../assets/img/ruota.svg" width="128" alt="Wheel Diameter" />
            </div>
            <div class="column has-text-centered">
                <img v-bind:style="{ animation:  'spin '+ (60/rpm) +'s linear infinite'}" src="../assets/img/bike-crankset.svg" width="128" alt="Crankset" />
            </div>
    
        </div>

    </div>
</template>

<script>
export default {
    data() {
        return {
            rpm: 70,
            crankset: 50,
            cassette: 18,
            diameter_wheel: 2098.58 // ( 622 + 23 + 23 ) * PI
        }

    }
}
</script>

<style>
.stat-key {
    font-size: 20px;
    font-weight: 200;
}

.stat-val {
    font-size: 35px;
    font-weight: bold;
}

@-moz-keyframes spin {
    100% {
        -moz-transform: rotate(360deg);
    }
}

@-webkit-keyframes spin {
    100% {
        -webkit-transform: rotate(360deg);
    }
}

@keyframes spin {
    100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
    }
}
</style>