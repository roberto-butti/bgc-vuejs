<template>
    <div class="section">
        <div class="columns">
            <div class="column">
                <div class="field">
                    <label class="label">Cadence (pedaling rate)<!--Pedalate al minuto--></label>
                    <div class="control">
                        <input id="rpm" class="input is-large" v-on:keyup="track" type="number" v-model.number="rpm" placeholder="RPM">
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="field">
                    <label class="label">Chainset<!--Corona anteriore--></label>
                    <div class="control">
                        <input id="crankset" v-on:keyup="track" class="input is-large" type="number" v-model.number="crankset" placeholder="Crankset">
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="field">
                    <label class="label">Cassette<!--Pignone posteriore--></label>
                    <div class="control">
                        <input id="cassette" v-on:keyup="track" class="input is-large" type="number" v-model.number="cassette" placeholder="Cassette">
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="field">
                    <label class="label">Wheel size mm.<!--Circonferenza ruota (mm.)--></label>
                    <div class="control">
                        <input id="diameter_wheel" v-on:keyup="track" class="input is-large" type="number" v-model.number="diameter_wheel" placeholder="Diameter Wheel">
                    </div>
                </div>
            </div>
    
        </div>
        <div class="columns">
            <div class="column">
                <p class="stat-val has-text-centered">{{ secondsPerPedal }} s.</p>
                <p class="stat-key has-text-centered">Seconds for a stroke of pedal<!--Secondi per fare una pedalata completa.--></p>
            </div>    
            <div class="column">
                <p class="stat-val has-text-centered">{{ gearRatio }}</p>
                <p class="stat-key has-text-centered">Gear Ratio</p>
            </div>
            <div class="column">
                <p class="stat-val has-text-centered">{{ wheelRpm }} rpm</p>
                <p class="stat-key has-text-centered">Wheel RPM</p>
            </div>
            <div class="column">
                <p class="stat-val has-text-centered">{{ secondsPerWheel }} s.</p>
                <p class="stat-key has-text-centered">Wheel speed in seconds<!--Secondi per un giro di ruota--></p>
            </div>
            <div class="column">
                <p class="stat-val has-text-centered">{{ speed }} km/h</p>
                <p class="stat-key has-text-centered">Speed Km/h</p>
            </div>
        </div>    
        <div class="columns">
            <div class="column has-text-centered">
                <img v-bind:style="{ animation:  'spin '+ secondsPerWheel +'s linear infinite'}" src="../assets/img/ruota.svg" width="128" alt="Wheel Diameter" />
            </div>
            <div class="column has-text-centered">
                <img v-bind:style="{ animation:  'spin '+ secondsPerPedal +'s linear infinite', 'transform-origin': '40.5% 54.7%'}" src="../assets/img/bike-crankset.svg" width="128" alt="Crankset" />
            </div>
    
        </div>
        <div class="box  has-text-centered">
            <a class="button is-primary" v-bind:href="url">Share your configuration</a>
        </div>
        <div class="box  has-text-centered">
            <img :src="qrimg" />
            <!-- {{ qrimg }} -->
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            rpm: (this.$route.query.rpm === undefined ? 70 : this.$route.query.rpm),
            crankset: (this.$route.query.crankset === undefined ? 50 : this.$route.query.crankset),
            cassette: (this.$route.query.cassette === undefined ? 18 : this.$route.query.cassette),
            diameter_wheel: (this.$route.query.diameter_wheel === undefined ? 2098.58 : this.$route.query.diameter_wheel), //2098.58 // ( 622 + 23 + 23 ) * PI
        }
    },
    methods: {
        track: function (event) {
            window.ga('send', {
                hitType: 'event',
                eventCategory: 'input',
                eventAction: 'set',
                eventLabel: event.target.id,
                eventValue: event.target.value
            })
        },
        createUrl: function () {
            // console.log(window.location)
            return window.location.origin+"/?rpm="+this.rpm+"&crankset="+this.crankset+"&cassette="+this.cassette+"&diameter_wheel="+this.diameter_wheel
        }
    },
    computed: {
        qrimg: function() {
            // return "http://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=http%3A//bike-gear.surge.sh/&chld=H|0"
            return "http://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=" + encodeURIComponent(this.createUrl()) + "&chld=H|0"
        },
        url: function() {
            // return "/?rpm="+this.rpm+"&crankset="+this.crankset+"&cassette="+this.cassette+"&diameter_wheel="+this.diameter_wheel
            return this.createUrl()
        },
        secondsPerPedal: function () {
            return (1/(this.rpm/60)).toFixed(2)
        },
        gearRatio: function () {
            return (this.crankset/this.cassette).toFixed(2)
        },
        wheelRpm: function () {
            return ((this.crankset/this.cassette)*this.rpm).toFixed(2)
        },
        secondsPerWheel: function () {
            return (1/((this.crankset/this.cassette)*this.rpm/60)).toFixed(2)
        },
        speed: function () {
            return ((((this.crankset/this.cassette)*this.diameter_wheel*this.rpm)/1000000)*60).toFixed(2)
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